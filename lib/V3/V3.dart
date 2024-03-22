import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../V1/V1.dart';
import '../V2/V2V2.dart';
import '../V4/V4V2.dart';
import 'V3V2.dart';

class V3 extends StatefulWidget {

  @override
  State<V3> createState() => _V3State();
}

class _V3State extends State<V3> {//"",


  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2,
        child: Scaffold(appBar:  AppBar(backgroundColor: Colors.white,elevation: 0,
          bottom: TabBar(
            isScrollable: true, unselectedLabelColor: Colors.black.withOpacity(0.3), unselectedLabelStyle: TextStyle(fontSize: 12.0),
            labelColor: Colors.black, labelStyle: TextStyle(fontSize: 16.0), indicatorColor: Colors.black, indicatorWeight: 2.0,
            tabs: [
              Tab(child: Text("ルーティン"),),
              Tab(child: Text('if-then'),),
            ],),
          title: Text("習慣の壁", style: TextStyle(color: Colors.blueGrey[800], fontWeight: FontWeight.bold, fontSize: 20,),textAlign: TextAlign.center,),
          actions: <Widget>[IconButton(onPressed: () {start();}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
        ),
          body: TabBarView(
            children: [V31(),V32(),],),),
      ),
    );
  }
  void start(){showModalBottomSheet(isScrollControlled: true, context: context,backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) {return Container(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("ルール1",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("毎日行うルーティンを決める",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("ルール2",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("重要ではないことは極力省く",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("ルール3",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("ズレることを前提に完璧を求めない",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("ルール4",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5,bottom: 30),child:Text("行動は知識や目的と共に",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
              ])));});}
}





// class V31 extends StatefulWidget {
//
//   @override
//   State<V31> createState() => _V31State();
//   }
//
//   class _V31State extends State<V31> {
//     var item = ["起床","カーテンを開ける","ベットメイキング","水を飲む","朝ご飯","歯磨き","身支度","家を出る","学校","昼ごはん","昼休み","部活","帰宅","勉強","夜ご飯","自由時間","お風呂","ストレッチ","歯磨き","読書","明日Todoリストと今不安を感じている事を書く","就寝",];
//     late TextEditingController _bodyController;
//     var text = "";
//
//     void initState() {
//   super.initState();_bodyController = TextEditingController();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//       // appBar: AppBar(backgroundColor: Colors.white,
//       //   title:   Container(margin:EdgeInsets.only(top:0,left: 0),alignment:Alignment.bottomLeft,child:Text("ルーティン",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
//       //   elevation: 0,
//       //   actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
//       // ),
//       floatingActionButton: FloatingActionButton(onPressed: () {add();}, backgroundColor: Colors.green, child:Icon(Icons.edit_note),),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(margin:EdgeInsets.only(top:10,left: 20),alignment:Alignment.bottomLeft,child:Text("今日の頑張りは将来のあなたへのプレゼント",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
//             Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
//               itemCount: item.length, itemBuilder: (context, index) {
//                 return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
//                   title: Text(item[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
//                   onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3V2(item[index])));},
//                 ),);},),),
//             Container(height: 50,),
//
//
//           ],),),);
//   }
//
//     Future<void> add() async {
//       showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('ルーティン',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
//         actions: <Widget>[
//           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
//             Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
//               child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none,hintText: "例:ベットメイキング" ),onChanged: (String value) {text = value;},),),
//             Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
//                 onPressed: () {setState(() {_bodyController.clear();Navigator.pop(context);});})),
//           ],)],));
//     }
//
//     }
//
// class V32 extends StatefulWidget {
//
//   @override
//   State<V32> createState() => _V32State();
// }
//
// class _V32State extends State<V32> {
//   var item = ["起床","カーテンを開ける","ベットメイキング","水を飲む","朝ご飯","歯磨き","身支度","家を出る","学校","昼ごはん","昼休み","部活","帰宅","勉強","夜ご飯","自由時間","お風呂","ストレッチ","歯磨き","読書","明日Todoリストと今不安を感じている事を書く","就寝",];
//   late TextEditingController _bodyController;
//   var text = "";
//
//   void initState() {
//     super.initState();_bodyController = TextEditingController();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//       // appBar: AppBar(backgroundColor: Colors.white,
//       //   title:   Container(margin:EdgeInsets.only(top:0,left: 0),alignment:Alignment.bottomLeft,child:Text("ルーティン",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
//       //   elevation: 0,
//       //   actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
//       // ),
//       floatingActionButton: FloatingActionButton(onPressed: () {add();}, backgroundColor: Colors.green, child:Icon(Icons.edit_note),),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(margin:EdgeInsets.only(top:0,left: 20),alignment:Alignment.bottomLeft,child:TextButton(onPressed: () {},child: Text("if-thenプランニングとは?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),)),
//             Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
//               itemCount: item.length, itemBuilder: (context, index) {
//                 return GestureDetector(onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V2V2(item[index])));     },
//                 child: Card(elevation: 0,color:Colors.grey[100],child:
//                 Column(children: [
//                   Container(margin:EdgeInsets.only(top:10,left: 20), child:Text("やる気が出ない時は",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
//                   Container(margin:EdgeInsets.only(top:0,left: 20), child:Text("↓",style: TextStyle(color: Colors.blueGrey[300],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
//                   Container(margin:EdgeInsets.only(top:0,left: 20,bottom: 10), child:Text("スクワット10回",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
//                 ],)
//                 ));},),),
//           ],),),);
//   }
//
//   Future<void> add() async {
//     showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('if-thenプランニング',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
//       actions: <Widget>[
//         Column(mainAxisAlignment: MainAxisAlignment.center,children: [
//           Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
//             child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, hintText: "例:もしやる気が出ない時は"),onChanged: (String value) {text = value;},),),
//           Container(margin:EdgeInsets.only(top:10,left: 20), child:Text("↓",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
//           Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
//             child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, hintText: "例:スクワット10回"),onChanged: (String value) {text = value;},),),
//           Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
//               onPressed: () {setState(() {_bodyController.clear();Navigator.pop(context);});})),
//         ],)],));
//   }
//
//
// }






class V31 extends StatefulWidget {

  @override
  State<V31> createState() => _V31State();
}

class _V31State extends State<V31> {
  //var item = [{"text":"sjdkfl0","int":0},{"text":"sjdkfl1","int":1},{"text":"sjdkfl2","int":2},{"text":"sjdkfl3","int":3},];
  var item = [];var map = {};
  late TextEditingController _bodyController;
  var text = "";
  var ID = "";
  void initState() {
    super.initState();_bodyController = TextEditingController();
    set();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white,
      //   title:   Container(margin:EdgeInsets.only(top:0,left: 0),alignment:Alignment.bottomLeft,child:Text("ルーティン",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
      //   elevation: 0,
      //   actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
      // ),
      floatingActionButton: FloatingActionButton(onPressed: () {add();}, backgroundColor: Colors.green, child:Icon(Icons.edit_note),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(margin:EdgeInsets.only(top:10,left: 20),alignment:Alignment.bottomLeft,child:Text("今日の頑張りは将来のあなたへのプレゼント",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
            Container(margin:EdgeInsets.all(10),child:ReorderableListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                itemCount: item.length,
                itemBuilder: (context, i) =>
                    makeItemCard(item[i],context),
                onReorder: (int oldIndex, int newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  var item1 = item.removeAt(oldIndex);
                  item.insert(newIndex, item1);
                  for(int i = 0; i<item.length; i++){
                    item[i]["int"] = i;
                  }
                  print(item);
                }
            )),
            Container(height: 50,),


          ],),),);
  }

  Widget makeItemCard(item1, BuildContext context) {
    //(4) 公式サンプルのカラーをそのまま持ってきています
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    //(5) Card作成
    return Card(
      key: Key(item1["int"].toString()),elevation: 0,
      child: ListTile(
        title:Text(item1["ルーティン名"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3V2(item1,item,item1["int"])));},
                //elevation: 0,color:Colors.grey[100]
        tileColor: Colors.grey[100],
      ),
    );
  }
  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    FirebaseFirestore.instance.collection('users').where("ID",isEqualTo: ID).get().then((QuerySnapshot snapshot) {
      setState(() { snapshot.docs.forEach((doc) {item = doc["ルーティン"];});});});
  }


  Future<void> add() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('ルーティン',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none,hintText: "例:ベットメイキング" ),onChanged: (String value) {text = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {firebase();_bodyController.clear();Navigator.pop(context);});})),
        ],)],));
  }

  Future<void> firebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    map = {"ルーティン名":text,"知識":[],"開始時間":"00:00:00","メモ":"","ルーティン":[],"int":item.length};
    FirebaseFirestore.instance.collection('users').doc(ID).update({"ルーティン": FieldValue.arrayUnion([map])});
    setState(() {text = "";item.add(map);}); }

}

class V32 extends StatefulWidget {

  @override
  State<V32> createState() => _V32State();
}

class _V32State extends State<V32> {
  //var item = ["起床","カーテンを開ける","ベットメイキング","水を飲む","朝ご飯","歯磨き","身支度","家を出る","学校","昼ごはん","昼休み","部活","帰宅","勉強","夜ご飯","自由時間","お風呂","ストレッチ","歯磨き","読書","明日Todoリストと今不安を感じている事を書く","就寝",];
  var item = [];var map = {};
  late TextEditingController _bodyController;late TextEditingController _bodyController2;
  var text = "";var text2 = "";
  var ID = "";
  void initState() {
    super.initState();_bodyController = TextEditingController();_bodyController2 = TextEditingController();
    set();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white,
      //   title:   Container(margin:EdgeInsets.only(top:0,left: 0),alignment:Alignment.bottomLeft,child:Text("ルーティン",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
      //   elevation: 0,
      //   actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
      // ),
      floatingActionButton: FloatingActionButton(onPressed: () {add();}, backgroundColor: Colors.green, child:Icon(Icons.edit_note),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(margin:EdgeInsets.only(top:0,left: 20),alignment:Alignment.bottomLeft,child:TextButton(onPressed: () {},child: Text("if-thenプランニングとは?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),)),
            Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
              itemCount: item.length, itemBuilder: (context, index) {
                return GestureDetector(onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3V22(item[index],item,index)));     },
                    child: Card(elevation: 0,color:Colors.grey[100],child:
                    Column(children: [
                      Container(margin:EdgeInsets.only(top:10,left: 20), child:Text(item[index]["if"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
                      Container(margin:EdgeInsets.only(top:0,left: 20), child:Text("↓",style: TextStyle(color: Colors.blueGrey[300],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
                      Container(margin:EdgeInsets.only(top:0,left: 20,bottom: 10), child:Text(item[index]["then"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
                    ],)
                    ));},),),
          ],),),);
  }

  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    FirebaseFirestore.instance.collection('users').where("ID",isEqualTo: ID).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {setState(() { item = doc["if"];});
      });});}

  Future<void> add() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('if-thenプランニング',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, hintText: "例:もしやる気が出ない時は"),onChanged: (String value) {text = value;},),),
          Container(margin:EdgeInsets.only(top:10,left: 20), child:Text("↓",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController2,decoration: InputDecoration(border: InputBorder.none, hintText: "例:スクワット10回"),onChanged: (String value) {text2 = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {Add();_bodyController2.clear();Navigator.pop(context);});})),
        ],)],));
  }
  Future<void> Add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    map = {"if":text,"then":text2,"メモ":"","知識":[]};
    FirebaseFirestore.instance.collection('users').doc(ID).update({"if": FieldValue.arrayUnion([map])});
    setState(() {text = "";text2 = "";item.add(map);}); }


}

