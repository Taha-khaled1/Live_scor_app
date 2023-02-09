import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/main.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/app_strings.dart';
import '../cubit/soccer_cubit.dart';
import '../cubit/soccer_state.dart';

bool x = false;

class SoccerLayout extends StatelessWidget {
  const SoccerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoccerCubit, SoccerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SoccerCubit cubit = context.read<SoccerCubit>();
        return Scaffold(
          drawer: Draw(),
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              if (index == 1) {
                cubit.currentFixtures = cubit.dayFixtures;
              }
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: prefs.getString('a') == '1' ? "المباريات" : 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_soccer_rounded,
                  color: Colors.black,
                ),
                label: prefs.getString('a') == '1'
                    ? "المباريات الحية"
                    : 'fixtures',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.black,
                ),
                label:
                    prefs.getString('a') == '1' ? "ترتيب الفرق" : 'standings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper,
                  color: Colors.black,
                ),
                label: prefs.getString('a') == '1' ? 'الاخبار' : 'news',
              ),
            ],
          ),
        );
      },
    );
  }
}

class Draw extends StatefulWidget {
  Draw({Key? key});

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShearApp(),
                ),
              );
            },
            trailing: Text(
              prefs.getString('a') == '1' ? 'مشاركة التطبيق' : 'share app',
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(Icons.share),
          ),
          SizedBox(height: 12),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConactUs(),
                ),
              );
            },
            trailing: Text(
              prefs.getString('a') == '1' ? 'تواصل معنا ' : 'conact us',
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(Icons.help),
          ),
          SizedBox(height: 12),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Termss(),
                ),
              );
            },
            trailing: Text(
              prefs.getString('a') == '1'
                  ? 'سياسة الخصوصيه وشروط الاستخدام'
                  : "Privacy Policy and Terms of Use",
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(Icons.chat_rounded),
          ),
          SizedBox(height: 12),
          Divider(),
          SwitchListTile(
            title: Text(prefs.getString('a') == '1'
                ? 'تغير للغة التطبيق'
                : "change languege app"),
            value: x,
            onChanged: (value) {
              setState(() {
                x = value;
                if (x) {
                  prefs.setString('a', '2');
                } else {
                  prefs.setString('a', '1');
                }
              });

              setState(() {});
              print(prefs.getString('a'));
            },
          )
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:live_score/main.dart';
// import 'package:share_plus/share_plus.dart';

// import '../../../../core/utils/app_strings.dart';
// import '../cubit/soccer_cubit.dart';
// import '../cubit/soccer_state.dart';

// class SoccerLayout extends StatefulWidget {
//   const SoccerLayout({Key? key}) : super(key: key);

//   @override
//   State<SoccerLayout> createState() => _SoccerLayoutState();
// }

// class _SoccerLayoutState extends State<SoccerLayout> {
//   bool x = false;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SoccerCubit, SoccerStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         SoccerCubit cubit = context.read<SoccerCubit>();
//         return Scaffold(
//           backgroundColor: Colors.white,
// drawer: Drawer(
//   child: Column(
//     children: [
//       SizedBox(
//         height: 40,
//       ),
//       ListTile(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ShearApp(),
//             ),
//           );
//         },
//         trailing: Text(
//           'مشاركة التطبيق',
//           overflow: TextOverflow.ellipsis,
//         ),
//         leading: Icon(Icons.share),
//       ),
//       SizedBox(height: 12),
//       Divider(),
//       ListTile(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ConactUs(),
//             ),
//           );
//         },
//         trailing: Text(
//           'تواصل معنا ',
//           overflow: TextOverflow.ellipsis,
//         ),
//         leading: Icon(Icons.help),
//       ),
//       SizedBox(height: 12),
//       Divider(),
//       ListTile(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Termss(),
//             ),
//           );
//         },
//         trailing: Text(
//           'سياسة الخصوصيه وشروط الاستخدام',
//           overflow: TextOverflow.ellipsis,
//         ),
//         leading: Icon(Icons.chat_rounded),
//       ),
//       SizedBox(height: 12),
//       Divider(),
//       // SwitchListTile(
//       //   title: Text('تغير للغة التطبيق'),
//       //   value: x,
//       //   onChanged: (value) {
//       //     setState(() {
//       //       x = value;
//       //       x == true
//       //           ? prefs.setString('a', '2')
//       //           : prefs.setString('a', '1');
//       //     });
//       //   },
//       // )
//     ],
//   ),
// ),
//           appBar: AppBar(
//             title: Text(cubit.titles[cubit.currentIndex]),
//           ),
//           body: cubit.screens[cubit.currentIndex],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: cubit.currentIndex,
//             onTap: (int index) {
//               if (index == 1) {
//                 cubit.currentFixtures = cubit.dayFixtures;
//               }
//               cubit.changeBottomNav(index);
//             },
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home,
//                   color: Colors.black,
//                 ),
//                 label: AppStrings.home,
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.sports_soccer_rounded,
//                   color: Colors.black,
//                 ),
//                 label: AppStrings.fixtures,
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.bar_chart,
//                   color: Colors.black,
//                 ),
//                 label: AppStrings.standings,
//               ),
// BottomNavigationBarItem(
//   icon: Icon(
//     Icons.newspaper,
//     color: Colors.black,
//   ),
//   label: 'الاخبار',
// ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class ConactUs extends StatelessWidget {
  const ConactUs({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size xsize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back))
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              prefs.getString('a') == '1' ? 'الرقم الهاتف' : 'phone number',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: "The content to be copied"));
              },
              child: TextField(
                readOnly: true,
                showCursor: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Colors.blue), //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Colors.black), //<-- SEE HERE
                  ),
                  hintText: '212695394713',
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              prefs.getString('a') == '1' ? 'الإيمايل الخاص بنا' : 'my email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: "The content to be copied"));
              },
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Colors.blue), //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Colors.black), //<-- SEE HERE
                  ),
                  hintText: '3oma1993@gmail.com',
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              prefs.getString('a') == '1' ? 'موقع الخاص بنا' : 'my website',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: "The content to be copied"));
              },
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Colors.blue), //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Colors.black), //<-- SEE HERE
                  ),
                  hintText: 'https://rifsports.blogspot.com/',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShearApp extends StatefulWidget {
  const ShearApp({Key? key});

  @override
  State<ShearApp> createState() => _ShearAppState();
}

class _ShearAppState extends State<ShearApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back))
        // ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Share.share(
              'https://rifsports.blogspot.com/',
              subject: 'يرجي مشاركة التطبيق',
            );
          },
          child: Text(
              prefs.getString('a') == '1' ? 'مشاركة التطبيق' : 'share app'),
        ),
      ),
    );
  }
}

class Termss extends StatefulWidget {
  const Termss({Key? key});

  @override
  State<Termss> createState() => _TermssState();
}

class _TermssState extends State<Termss> {
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SwitchListTile(
                title: prefs.getString('a') == '1'
                    ? Text('الترجمه للغه العربيه')
                    : Text('translate to english'),
                value: x,
                onChanged: (value) {
                  setState(() {
                    x = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: !x
                  ? Text(
                      ''' 
          
      RifSport built the RifSport app as an Open Source app. This SERVICE is provided by RifSport at no cost and is intended for use as is.
      
      This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.
      
      If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.
      
      The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at RifSport unless otherwise defined in this Privacy Policy.
          
       For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to no. The information that I request will be retained on your device and is not collected by me in any way.
          
          
          ''',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )
                  : Text('''
      
      صممت RifSport تطبيق RifSport كتطبيق مفتوح المصدر. هذه الخدمة مقدمة من RifSport بدون تكلفة وهي مخصصة للاستخدام كما هي.
      
      تُستخدم هذه الصفحة لإعلام الزائرين بسياساتي من خلال جمع المعلومات الشخصية واستخدامها والكشف عنها إذا قرر أي شخص استخدام خدمتي.
      
      إذا اخترت استخدام خدمتي ، فأنت توافق على جمع واستخدام المعلومات المتعلقة بهذه السياسة. يتم استخدام المعلومات الشخصية التي أجمعها لتوفير الخدمة وتحسينها. لن أستخدم أو أشارك معلوماتك مع أي شخص باستثناء ما هو موضح في سياسة الخصوصية هذه.
      
      المصطلحات المستخدمة في سياسة الخصوصية هذه لها نفس المعاني الواردة في الشروط والأحكام الخاصة بنا ، والتي يمكن الوصول إليها في RifSport ما لم يتم تحديد خلاف ذلك في سياسة الخصوصية هذه.
          
        للحصول على تجربة أفضل ، أثناء استخدام خدمتنا ، قد أطلب منك تزويدنا بمعلومات تعريف شخصية معينة ، بما في ذلك على سبيل المثال لا الحصر لا. سيتم الاحتفاظ بالمعلومات التي أطلبها على جهازك ولن يتم جمعها بأي شكل من الأشكال.
      
      '''),
            )
          ],
        ),
      ),
    );
  }
}
