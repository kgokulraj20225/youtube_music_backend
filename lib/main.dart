// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(demo_app());
// // }
// //
// // class demo_app extends StatelessWidget {
// //   const demo_app({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: one(),
// //     );
// //   }
// // }
// //
// // class one extends StatefulWidget {
// //   const one({super.key});
// //
// //   @override
// //   State<one> createState() => _oneState();
// // }
// //
// // class _oneState extends State<one> {
// //   List<int> a = [1, 2, 3, 4, 5];
// //   List<String> b = ['master', 'hero', 'legend'];
// //   Map<String, dynamic> maps = {"apple": 1, "banana": 2, 'mango': 3};
// //
// //   Future<void> square() async {
// //     Iterable<int> sum = a.map((num) {
// //       return num * num;
// //     });
// //     List<int> add = a.map((data) {
// //       return data + 5;
// //     }).toList();
// //     List<String> numbers = maps.entries.map((data) {
// //       return '${data.key}:${data.value}';
// //     }).toList();
// //     List<Map<String, dynamic>> jsondata = [
// //       {'id': 1, 'name': 'Dr. A'},
// //       {'id': 2, 'name': 'Dr. B'}
// //     ];
// //     List<String> nameOnly = jsondata.map((data) {
// //       return '${data['name']}';
// //     }).toList();
// //     showDialog(
// //         context: context,
// //         builder: (context) => AlertDialog(
// //               title: Text('the square value is :'),
// //               content: Text('$nameOnly'),
// //             ));
// //     print('$nameOnly');
// //   }
// //
// //   Future<void> upperrcase() async {
// //     Iterable<String> uppder_name = b.map((upp) {
// //       return upp.toUpperCase();
// //     });
// //     List<String> upper = uppder_name.toList();
// //     print('$upper');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Map<String, int> user = {"id": 1};
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       appBar: AppBar(),
// //       body: Center(
// //         child: Stack(
// //           clipBehavior: Clip.none,
// //           children: [
// //             Card(
// //               child: Container(
// //                 height: 400,
// //                 width: 300,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             Positioned(
// //               left: 50,
// //               top: -70,
// //               child: CircleAvatar(
// //                 radius: 100,
// //                 backgroundImage: NetworkImage(
// //                     'https://lh3.googleusercontent.com/ogw/AF2bZyhqwBo2UIpgYznnbNzuSCMM_4yALoo9T3O0taI6V8FrWc8=s64-c-mo',
// //                     scale: 1),
// //               ),
// //             ),
// //             Positioned(
// //               left: 50,
// //               top: 200,
// //               child: Column(
// //                 children: [
// //                   Text(
// //                     "Gokulraj K",
// //                     style: TextStyle(
// //                         color: Colors.black,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 20),
// //                   ),
// //                   Text(
// //                     "kgokulraj20022005@gmail.com",
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontWeight: FontWeight.normal,
// //                     ),
// //                   ),
// //                   OutlinedButton(
// //                       onPressed: () {
// //                         print(user['id']);
// //
// //                         square();
// //                         upperrcase();
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => first_stack()));
// //                       },
// //                       style:
// //                           OutlinedButton.styleFrom(backgroundColor: Colors.red),
// //                       child: Text("press"))
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class first_stack extends StatefulWidget {
// //   const first_stack({super.key});
// //
// //   @override
// //   State<first_stack> createState() => _first_stackState();
// // }
// //
// // class _first_stackState extends State<first_stack> {
// //   String one = 'A';
// //   double dou = 20.0;
// //   bool onec = false;
// //   String ab = 'a';
// //   String ab1 = 'apple';
// //   final List<String> a = ['a', 'b', 'c'];
// //   final List<Color> colour = [
// //     Colors.black,
// //     Colors.red,
// //     Colors.green,
// //     Colors.blue
// //   ];
// //   dynamic selectedIndex = 1;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: selectedIndex,
// //         onTap: (index) {
// //           setState(() {
// //             selectedIndex = index;
// //           });
// //         },
// //         items: [
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.settings), label: "Settings"),
// //         ],
// //       ),
// //
// //       // BottomNavigationBar(
// //       //   // shape: CircularNotchedRectangle(),
// //       //   // notchMargin: 10,
// //       //   // elevation: 50,
// //       //   : [Row(
// //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       //     children: [
// //       //       IconButton(icon: Icon(Icons.menu), onPressed: () {
// //       //         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
// //       //       }),
// //       //       IconButton(icon: Icon(Icons.search), onPressed: () {}),
// //       //     ],
// //       //   )],
// //       // ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {},
// //         child: Icon(Icons.add),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //       drawer: Drawer(
// //           child: ListView(children: [
// //         DrawerHeader(
// //           decoration: BoxDecoration(color: Colors.blue),
// //           child: Text('Welcome!', style: TextStyle(color: Colors.white)),
// //         ),
// //         ListTile(
// //           leading: Icon(Icons.home),
// //           title: Text('Home'),
// //           onTap: () {
// //             print('Go to Home');
// //           },
// //         ),
// //         ListTile(
// //           leading: Icon(Icons.settings),
// //           title: Text('Settings'),
// //           onTap: () {
// //             print('Go to Settings');
// //           },
// //         ),
// //       ])),
// //
// //       appBar: AppBar(),
// //       // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //       // floatingActionButton: FloatingActionButton(onPressed: (){
// //       //   print("the button clicked");
// //       // },child: Icon(Icons.add),autofocus: true,shape: CircleBorder(),),
// //       body: ListView(children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             Flexible(
// //                 fit: FlexFit.loose,
// //                 flex: 2,
// //                 child: Container(
// //                   height: 100,
// //                   color: Colors.blue,
// //                 )),
// //             Flexible(
// //                 fit: FlexFit.loose,
// //                 flex: 1,
// //                 child: Container(
// //                   height: 100,
// //                   color: Colors.red,
// //                 ))
// //           ],
// //         ),
// //         Container(
// //           height: 200,
// //           width: 400,
// //           color: Colors.grey,
// //           child: Column(
// //             children: [
// //               Spacer(
// //                 flex: 4,
// //               ),
// //               Align(
// //                 alignment: Alignment.center,
// //                 child: Container(
// //                   width: 100,
// //                   height: 100,
// //                   color: Colors.red,
// //                 ),
// //               ),
// //               Spacer(
// //                 flex: 1,
// //               ),
// //               Align(
// //                 alignment: Alignment.bottomLeft,
// //                 child: Container(
// //                   width: 100,
// //                   height: 100,
// //                   color: Colors.yellow,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         CheckboxListTile(
// //             autofocus: true,
// //             subtitle: Text("sub text"),
// //             focusNode: FocusNode(canRequestFocus: true),
// //             title: Text("accept the terms & condition!"),
// //             value: onec,
// //             onChanged: (bool? ones) {
// //               setState(() {
// //                 onec = ones!;
// //               });
// //             }),
// //         RadioListTile<String>(
// //           value: 'a',
// //           groupValue: ab,
// //           onChanged: (String? ones) {
// //             setState(() {
// //               ab = ones!;
// //               print(ab);
// //             });
// //           },
// //           title: Text("option a"),
// //         ),
// //         RadioListTile<String>(
// //           value: 'b',
// //           groupValue: ab,
// //           onChanged: (String? ones) {
// //             setState(() {
// //               ab = ones!;
// //               print(ab);
// //             });
// //           },
// //           title: Text('option b'),
// //         ),
// //         SwitchListTile(
// //           value: onec,
// //           onChanged: (bool? de) {
// //             setState(() {
// //               onec = de!;
// //             });
// //           },
// //           title: Text("options"),
// //         ),
// //         Slider(
// //           value: dou,
// //           min: 0,
// //           max: 100,
// //           divisions: 100,
// //           label: dou.round().toString(),
// //           onChanged: (double value) {
// //             setState(() {
// //               dou = value;
// //             });
// //           },
// //         ),
// //         DropdownButton<String>(
// //           value: ab,
// //           onChanged: (String? newValue) {
// //             setState(() {
// //               ab = newValue!;
// //               print(ab);
// //             });
// //           },
// //           items: a.map<DropdownMenuItem<String>>((String value) {
// //             return DropdownMenuItem<String>(
// //               value: value,
// //               child: Text(value),
// //             );
// //           }).toList(),
// //         ),
// //         DropdownButton<String>(
// //             value: ab1,
// //             items: [
// //               DropdownMenuItem(
// //                 child: Text(
// //                   'apple',
// //                 ),
// //                 value: 'apple',
// //               ),
// //               DropdownMenuItem(
// //                 child: Text(
// //                   'banana',
// //                 ),
// //                 value: 'banana',
// //               ),
// //               DropdownMenuItem(
// //                 child: Text(
// //                   'grape',
// //                 ),
// //                 value: 'grape',
// //               ),
// //             ],
// //             onChanged: (String? num) {
// //               setState(() {
// //                 ab1 = num!;
// //               });
// //             }),
// //         // DropdownButton<String>(
// //         //   value: 'apple',
// //         //   items: [
// //         //     DropdownMenuItem(child: Text('apple'), value: 'apple'),
// //         //     DropdownMenuItem(child: Text('banana'), value: 'banana'),
// //         //     DropdownMenuItem(child: Text('grape'), value: 'grape'),
// //         //   ],
// //         //   onChanged: (String? num) {
// //         //     if (num != null) {
// //         //       setState(() {
// //         //         ab = num;
// //         //       });
// //         //     }
// //         //   },
// //         // )
// //         // ListView.builder(
// //         //   shrinkWrap: true,
// //         //   itemCount: colour.length,
// //         //     itemBuilder: (context,indexs){
// //         //     var bu=colour[indexs];
// //         //   return Container(
// //         //
// //         //     height: 100,
// //         //     width: 100,
// //         //     // child: Text('$bu'),
// //         //     color: Colors.black,
// //         //
// //         //   );
// //         // }),
// //         GridView.builder(
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: 2,
// //             crossAxisSpacing: 1,
// //             mainAxisSpacing: 1,
// //           ),
// //           shrinkWrap: true,
// //           itemCount: a.length,
// //           itemBuilder: (context, index) {
// //             var one = a[index];
// //             return Container(
// //                 color: Colors.blueAccent,
// //                 child: Center(child: Text("Item $one ")));
// //           },
// //         ),
// //
// //         ListTile(
// //           leading: Icon(Icons.person),
// //           // Left-side icon
// //           title: Text('John Doe'),
// //           // Main text
// //           subtitle: Text('Software Engineer'),
// //           // Small text below title
// //           trailing: Icon(Icons.arrow_forward_ios),
// //           // Right-side icon
// //           onTap: () {
// //             print('Tile tapped');
// //           },
// //         ),
// //
// //         Container(
// //           height: 500,
// //         ),
// //       ]),
// //     );
// //   }
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //             width: 200,
// //             height: 200,
// //             color: Colors.red,
// //           ),
// //           // Positioned(
// //           //   top: 50,
// //           //   left: 50,
// //           //   child: Container(
// //           //     width: 100,
// //           //     height: 100,
// //           //     color: Colors.blue,
// //           //   ),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// // This is a StatelessWidget (UI never changes itself)
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// // This is a StatefulWidget (UI changes when button pressed)
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int count = 0; // This is our state (data that can change)
//
//   void incrementCounter() {
//     setState(() {
//       count++; // Update the state
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: AppTitle(), // Using Stateless widget here
//       ),
//       body: Center(
//         child: Text(
//           'Count: $count',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: incrementCounter,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// // A separate StatelessWidget for the title
// class AppTitle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Stateless Title");
//   }
// }

import 'package:demo_flutter_project/app/modules/authedication/auth_binding.dart';
import 'package:demo_flutter_project/app/modules/direct_navigation/binding/direct_binding.dart';
import 'package:demo_flutter_project/app/modules/first_api_service/binding_api/binding_api.dart';
import 'package:demo_flutter_project/app/modules/first_api_service/binding_api/song_binding.dart';
import 'package:demo_flutter_project/app/modules/indirect_nav_task/twoth_page.dart';
import 'package:demo_flutter_project/app/modules/indirect_navigation/indirect_binding/indirect_binding.dart';
import 'package:demo_flutter_project/app/modules/indirect_navigation/pages/first_indirect_pages.dart';
import 'package:demo_flutter_project/app/modules/indirect_navigation/pages/second_indirect_pages.dart';
import 'package:demo_flutter_project/app/modules/indirect_navigation/pages/third_indirect.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_controller/login_controller.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_pages/gotoprofile.dart';
import 'package:demo_flutter_project/app/modules/login_process/login_pages/home_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/home_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/profile_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/settings_page.dart';
import 'package:demo_flutter_project/app/modules/login_with_indirect/splash_screen.dart';
import 'package:demo_flutter_project/app/routes/middleware/authguard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/authedication/auth_views.dart';
import 'app/modules/backend_songs_name_display/backend_hand_binding/backend_binding.dart';
import 'app/modules/backend_songs_name_display/backend_show_pages/display_backend_data.dart';
import 'app/modules/demo_list/demo_views.dart';
import 'app/modules/direct_navigation/pages/first_page.dart';
import 'app/modules/first_api_service/pages_api/api_views_data_pages.dart';
import 'app/modules/indirect_nav_task/first_nav_fir_page.dart';
import 'app/modules/login_process/login_pages/login_pages.dart';
import 'app/modules/login_with_indirect/login_page.dart';
import 'app/routes/app_route.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  await GetStorage.init();
  Get.put(login_controller());
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'getx counter example',
      // initialRoute: '/oneth',
      // // home: login_pages(),
      // // getPages: [
      // //   GetPage(
      // //       name: '/logis',
      // //       page: ()=>first_page(),
      // //     binding: direct_binding()
      // //   ),
      // // ],
      // getPages: [
      //   GetPage(name: '/oneth',
      //       page: ()=>indirect_nav(),
      //   ),
      //   GetPage(name: '/twoth', page: ()=>twoth_page()),
      //   // GetPage(name: '/home', page: ()=>home_screen()),
      //   // GetPage(name: '/setting', page: ()=>setting_screen()),
      //   // GetPage(name: '/profile', page: ()=>profile_screen()),
      // ],
      debugShowCheckedModeBanner: false,
      // home: display_song(),
        initialRoute: '/demo',
      getPages: [
        GetPage(name: '/demo', page: ()=>display_song(),binding: backend_binding()),

      ]
    );
  }
}
