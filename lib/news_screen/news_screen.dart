import 'package:flutter/material.dart';
import 'package:live_score/news_screen/bannerWidget.dart';
import 'package:live_score/news_screen/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'database/connectdatabase.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsModel? newsvarible;
  getHotelByTypeRespon(String country) async {
    Curd curd = Curd();
    var respons = await curd.getrequest(
      'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=04b61cece298410b86e20133a9e8b083',
    );
    newsvarible = NewsModel.fromJson(respons);
    setState(() {});
    return respons;
  }

  @override
  void initState() {
    getHotelByTypeRespon('eg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size xsize = MediaQuery.of(context).size;
    return Scaffold(
      body: newsvarible == null
          ? Center(
              child: SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: newsvarible?.articles?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 200,
                        width: xsize.width * 0.95,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(offset: Offset(0, 2), color: Colors.grey)
                          ],
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            newsvarible?.articles?[index].urlToImage ==
                                        'https://lh3.googleusercontent.com/J6_coFbogxhRI9iM864NL_liGXvsQp2AupsKei7z0cNNfDvGUmWUy20nuUhkREQyrpY4bEeIBuc=s0-w300-rw' ||
                                    newsvarible?.articles?[index].urlToImage ==
                                        "https://lh3.googleusercontent.com/J6_coFbogxhRI9iM864NL_liGXvsQp2AupsKei7z0cNNfDvGUmWUy20nuUhkREQyrpY4bEeIBuc=s0-w300"
                                ? SizedBox(
                                    height: 200,
                                    width: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://assets.publishing.service.gov.uk/government/uploads/system/uploads/image_data/file/148302/s960_Football_goal_gov.uk.jpg',
                                        height: 200,
                                        width: 170,
                                        fit: BoxFit.fitHeight,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Text('لا يتوفر صوره');
                                        },
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 200,
                                    width: 170,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        newsvarible
                                                ?.articles?[index].urlToImage ??
                                            'https://lh3.googleusercontent.com/J6_coFbogxhRI9iM864NL_liGXvsQp2AupsKei7z0cNNfDvGUmWUy20nuUhkREQyrpY4bEeIBuc=s0-w300-rw',
                                        height: 200,
                                        width: 170,
                                        fit: BoxFit.fitHeight,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Text('لا يتوفر صوره');
                                        },
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    newsvarible?.articles?[index].title ??
                                        'لا يوجد تفاصيل',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.end,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () async {
                                        if (!await launchUrl(
                                          Uri.parse(
                                              '${newsvarible?.articles?[index].url}'),
                                        )) {
                                          // SnackBar(
                                          //   content: Text(
                                          //       'لا يمكنك الانتقال الي هذه الصفحه'),
                                          // );
                                          print(
                                              ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
                                        }
                                      },
                                      child: Text(
                                        'تفاصيل الخبر',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 6),
                            //   child: Wrap(
                            //     children: [
                            //       Text(
                            //         newsvarible?.articles?[index].title ??
                            //             'لا يوجد تفاصيل',
                            //         style: TextStyle(fontSize: 12),
                            //         textAlign: TextAlign.end,
                            //       ),
                            // Align(
                            //   alignment: Alignment.bottomRight,
                            //   child: InkWell(
                            //     onTap: () async {
                            //       if (!await launchUrl(
                            //         Uri.parse(
                            //             '${newsvarible?.articles?[index].url}'),
                            //       )) {
                            //         // SnackBar(
                            //         //   content: Text(
                            //         //       'لا يمكنك الانتقال الي هذه الصفحه'),
                            //         // );
                            //         print(
                            //             ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
                            //       }
                            //     },
                            //     child: Text(
                            //       'تفاصيل الخبر',
                            //       style: TextStyle(color: Colors.red),
                            //     ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Banner2(x: false),
              ],
            ),
    );
  }
}
