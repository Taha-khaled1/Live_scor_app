// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:live_score/news_screen/database/ShardFunction/checkenternet.dart';
import 'package:live_score/news_screen/database/ShardFunction/statusrequst.dart';
import 'dart:convert';
import 'package:path/path.dart';
// // headers: <String, String>{'Content-Type': 'application/json'},
// // String _basicAuth = 'Basic ${base64Encode(utf8.encode('wael:wael1'))}';

// Map<String, String> myheaders = {'Content-Type': 'application/json'};
// Map<String, String> myheaders5 = {'Content-Type': 'application/json'};
// Map<String, String> myheaders2 = {
//   'Cookie': 'access_token=${sharedPreferences.getString('token')}'
// };

// Map<String, String> myheaders3 = {
//   'Content-Type': 'application/json',
//   'Cookie': 'access_token=${sharedPreferences.getString('token')}'
// };

class Curd {
  getrequest(String url) async {
    try {
      Response respos = await http.get(Uri.parse(url));

      if (respos.statusCode == 200) {
        dynamic body = jsonDecode(respos.body);
        print(' body :  $body');
        return body;
      } else {
        print('erorr');
      }
    } catch (e) {
      // ignore: avoid_print
      print('$e');
    }
  }

  postrequest(String url, Map data, {bool? encode}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.post(Uri.parse(url),
            body: encode == true ? jsonEncode(data) : data);
        if (respos.statusCode == 200) {
          dynamic body = jsonDecode(respos.body);

          return body;
        } else {
          return StatusRequest.serverfailure;
        }
      } else {
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      return StatusRequest.serverfailure;
    }
  }
}
