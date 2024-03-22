import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'V2V2.dart';
class V2 extends StatefulWidget {

  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
 // var item = [];
  var item = [];
  var item1 = []; var item2 = [];var itemAll = [];
  var name = "";
  var co = 0;
  var ID = "";


  void initState() {
    super.initState();
    set();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title:  Container(margin:EdgeInsets.only(top:0,left: 0),alignment:Alignment.bottomLeft,child:Text("OutputList",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)), elevation: 0,
        actions: <Widget>[IconButton(onPressed: () {SearchShow();}, icon: Icon(Icons.search,color: Colors.black87,))],
      ),
      body:  Column(
          children: <Widget>[
            Container(margin:EdgeInsets.only(top:0,left: 20,bottom: 20),alignment:Alignment.bottomLeft,child:Text("好奇心を持ってアウトプットしてみましょう",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
            Expanded(child:GridView.count(padding: EdgeInsets.all(10.0), crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, childAspectRatio: 2, shrinkWrap: true,//controller: controller,
                children: List.generate(item.length, (index) {
                  return GestureDetector(onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V2V2(item[index],itemAll)));     },
                    child:Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius:0.5, color: Colors.grey, )]),alignment:Alignment.center,
                      child:Column(mainAxisAlignment:MainAxisAlignment.center,children: [
                        Container(margin:EdgeInsets.only(top: 10),alignment:Alignment.center,child:Text(item[index]["題名"].toString(),style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                        Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                          Container(margin:EdgeInsets.only(top: 10),child: Icon(Icons.star,color: Colors.blueGrey),),
                          Container(margin:EdgeInsets.only(top: 12),alignment:Alignment.center,child:Text(item[index]["星"].toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                        ],)    ],)));}))),
          ],));
  }

  void SearchShow() {
    showModalBottomSheet(isScrollControlled: true,context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(child:SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () { co = 0;search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("まだやっていない",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                   Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {co = 5;search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★★★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {co = 4;;search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {co = 3;;search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {co = 2;search ();},
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () { co = 1;search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  //   Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "リセット";setState(() {widget.item = item0;}); },
                  //     child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("リセット",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                ],)),);});}, );}

  void search (){
  //   item = [];item1 = item2;
  // for (int ii = 0; ii < item1.length; ii++) {
  //   if (item1[ii][3] == name) {
  //     setState(() {  item.add(item1[ii]);});
  //   }}
  // if (item.length == 0){ setState(() { item1 = [];});}
  // item1 = item;
  // Navigator.pop(context);
  }

  Future<void> set() async {item = [];itemAll = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    FirebaseFirestore.instance.collection('users').where("ID",isEqualTo: ID).get().then((QuerySnapshot snapshot) {
      setState(() { snapshot.docs.forEach((doc) {itemAll = doc["アウトプット"];item = doc["アウトプット"];print(item);print(itemAll);});});});
    }


}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// class V2 extends StatefulWidget {
//
//   @override
//   State<V2> createState() => _V2State();
// }
//
// class _V2State extends State<V2> {
//   void initState() {
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(length: 2,
//         child: Scaffold(
//           appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
//             bottom: TabBar(
//               isScrollable: true, unselectedLabelColor: Colors.black.withOpacity(0.3), unselectedLabelStyle: TextStyle(fontSize: 12.0),
//               labelColor: Colors.black, labelStyle: TextStyle(fontSize: 16.0), indicatorColor: Colors.black, indicatorWeight: 2.0,
//               tabs: [
//                 Tab(child: Text('Top'),),
//                 Tab(child: Text('やってみる'),),
//               ],),
//             title: Text("OutputList", style: TextStyle(color: Colors.blueGrey[800], fontWeight: FontWeight.bold, fontSize: 20,),textAlign: TextAlign.center,),
//           ),
//           body: TabBarView(
//             children: [V2V1(),V2V1()],),),
//       ),
//     );
//   }
//
// }
//
//
//
// class V2V1 extends StatefulWidget {
//
//   @override
//   State<V2V1> createState() => _V2V1State();
// }
//
// class _V2V1State extends State<V2V1> {
//   var item = ["起床時間の固定","朝イチはベットメイキングから","朝イチでコップ一杯の水を","朝の冷水シャワーの効果","朝散歩のメリット","効果的なコーヒーの取り方","起床時間の固定","朝イチはベットメイキングから","朝イチでコップ一杯の水を","朝の冷水シャワーの効果","朝散歩のメリット","効果的なコーヒーの取り方","昼休みには仮眠をとる","立位で仕事や勉強する","シングルタスクに集中する"];
//   var item1 = [];
//   void initState() {
//     super.initState();
//     Saw();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//         body: Column(children: <Widget>[
//           Container(height: 30,),
//           Expanded(child:GridView.count(padding: EdgeInsets.all(10.0), crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, childAspectRatio: 2, shrinkWrap: true,//controller: controller,
//               children: List.generate(item.length, (index) {
//                 return GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2(item[index])));     },
//                     child:Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius:0.5, color: Colors.grey, )]),alignment:Alignment.center,
//                         child:Column(mainAxisAlignment:MainAxisAlignment.center,children: [
//                           Container(margin:EdgeInsets.only(top: 10),alignment:Alignment.center,child:Text(item[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
//                           Row(mainAxisAlignment:MainAxisAlignment.center,children: [
//                             Container(margin:EdgeInsets.only(top: 10),child: Icon(Icons.star,color: Colors.blueGrey),),
//                             Container(margin:EdgeInsets.only(top: 12),alignment:Alignment.center,child:Text("5",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
//                           ],)    ],)) );}))),
//           Container(height: 80,),
//         ]) );
//   }
//   Future<void> Saw() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     item1 =  prefs.getStringList("Saw")??[];
//
//   }
// }
//
//
// class V1V2 extends StatefulWidget {
//   V1V2(this.text);
//   String text;
//   @override
//   State<V1V2> createState() => _V1V2State();
// }
//
// class _V1V2State extends State<V1V2> {
//   var item = [];
//   void initState() {
//     super.initState();
//     Saw();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//       appBar: AppBar(elevation: 0,backgroundColor: Colors.white,
//         centerTitle: false,iconTheme: IconThemeData(color: Colors.black),
//         title: Text("Title"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(margin:EdgeInsets.only(top: 0),alignment:Alignment.center,child:Text(widget.text,style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
//             Container(margin :EdgeInsets.only(top:30,bottom: 100),child: ElevatedButton(
//               child: Text('OutputListに追加'), style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, onPrimary: Colors.white, shape: const StadiumBorder(),),
//               onPressed: () {},)),
//           ],),),);
//   }
//
//   Future<void> Add() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var aa =  prefs.getStringList("OutputList")??[];aa.add(item[0]);
//     prefs.setStringList("OutputList", aa);
//   }
//   Future<void> Saw() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var aa =  prefs.getStringList("Saw")??[];aa.add(item[0]);
//     prefs.setStringList("Saw", aa);
//   }
//
// }
//
//
//
//
//
//
//
//
