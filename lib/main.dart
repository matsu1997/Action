
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'V1/V1.dart';
import 'V2/V2.dart';
import 'V3/V3.dart';
import 'V4/V4.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //ここ！
  await Firebase.initializeApp(); //ここ！
  runApp(MyApp());
  //initializeDateFormatting().then((_) =>runApp(MyApp()));

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
// @override



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ページインデックス保存用
  int _screen = 0;

  // 表示する Widget の一覧
  static List<Widget> _pageList = [
    V1({}),V2(),V3(),V4()
  ];

  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.menu_book),
        label: '1→',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.directions_run),
        label: '2→',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.event_repeat),
        label: '3→',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.motion_photos_on),
        label: '4',
      ),

    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[900],
      //   title: Text(
      //     '国試plus',
      //     style: TextStyle(fontSize: 16),
      //   ),
      // ),
      // ページビュー
      body: _pageList[_screen],
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        type: BottomNavigationBarType.fixed,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),

    );

  }
}
