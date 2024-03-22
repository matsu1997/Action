
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../アカウント/SignUp.dart';
class V1 extends StatefulWidget {
  V1(this.map);
  Map  map;
  @override
  State<V1> createState() => _V1State();
}

class _V1State extends State<V1> {
  var ID = "";

  void initState() {
  super.initState();
  sign();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 9,
        child: Scaffold(appBar:  AppBar(backgroundColor: Colors.white,elevation: 0,
            bottom: TabBar(
              isScrollable: true, unselectedLabelColor: Colors.black.withOpacity(0.3), unselectedLabelStyle: TextStyle(fontSize: 12.0),
              labelColor: Colors.black, labelStyle: TextStyle(fontSize: 16.0), indicatorColor: Colors.black, indicatorWeight: 2.0,
              tabs: [
                Tab(child: Text('Top'),),
                Tab(child: Text('仕事'),),
                Tab(child: Text('人間関係'),),
                Tab(child: Text('マインドチェンジ'),),
                Tab(child: Text('健康'),),
                Tab(child: Text('勉強'),),
                Tab(child: Text('メンタル改善'),),
                Tab(child: Text('お金'),),
                Tab(child: Text('男女関係'),),
              ],),
            title: Text("Input", style: TextStyle(color: Colors.blueGrey[800], fontWeight: FontWeight.bold, fontSize: 20,),textAlign: TextAlign.center,),iconTheme: IconThemeData(color: Colors.black),
            actions: <Widget>[IconButton(onPressed: () {start();}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
          ),

          body: TabBarView(
            children: [V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),V1V1(widget.map),],),),
      ),
    );
  }

  void start(){showModalBottomSheet(isScrollControlled: true, context: context,backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) {return Container(
          child: SingleChildScrollView(
              child:  Container(margin :EdgeInsets.all(20),child:Column(children: <Widget>[
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("知識の壁",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("まずは視野を広げる為に知識を得ましょう",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("行動の壁",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("次に好奇心を持ってアウトプットしてみましょう",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("気づきの壁",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("次にその行動が心身にどう影響したか観察しましょう",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("技術の壁",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5),child:Text("次に楽に出来るように工夫してみましょう",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("習慣の壁",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
                Container(width:double.infinity,margin :EdgeInsets.only(top: 5,bottom: 30),child:Text("続けてみましょう\n技術の壁まで乗り越えた行動はあなたにとって大切な行動だったはず。将来の自分が「あの時頑張ってくれてありがとう」と感謝してくれると思います。",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),

                Container(width:double.infinity,margin :EdgeInsets.only(top: 5,bottom: 30),child:Text("このアプリが、素敵なあなたになる為のサポートに少しでもなれたら幸いです\n\nあなたと同じく目標に向かって頑張る開発者より",style: TextStyle(color: Colors.blueGrey[800],fontWeight: FontWeight.bold,fontSize: 10),textAlign: TextAlign.center,)),
              ]))));});}

  void sign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ID = prefs.getString("ID") ?? "";
    if (ID == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}
  }

}



class V1V1 extends StatefulWidget {
  V1V1(this.map);
  Map map;
  @override
  State<V1V1> createState() => _V1V1State();
}

class _V1V1State extends State<V1V1> {
  var item = ["コーヒーのNGとメリット"];
  var item1 = [];


  void initState() {
    super.initState();
    Saw();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,

      body: Column(children: <Widget>[
           Container(height: 30,),
            Expanded(child:GridView.count(padding: EdgeInsets.all(10.0), crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, childAspectRatio: 2, shrinkWrap: true,//controller: controller,
                children: List.generate(item.length, (index) {
                  return GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2(widget.map,item[index]))).then((value) => Saw());;     },
                      child:  item1.contains(item[index])?
                      Container(decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius:0.5, color: Colors.grey, )]),alignment:Alignment.center,child:Text(item[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)):
                      Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius:0.5, color: Colors.grey, )]),alignment:Alignment.center,child:Text(item[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                  );}))),
        Container(height: 80,),
         ]) );
  }
  Future<void> Saw() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() { item1 =  prefs.getStringList("Saw")??[];});

  }
}


class V1V2 extends StatefulWidget {
  V1V2(this.map,this.text);
  Map map;String text;
  @override
  State<V1V2> createState() => _V1V2State();
}

class _V1V2State extends State<V1V2> {
  var item = [];
  var ID = "";
  var map = {};


  void initState() {
    super.initState();
    Saw();itemSet ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white,
        centerTitle: false,iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(margin:EdgeInsets.only(top: 0),alignment:Alignment.center,child:Text(widget.text,style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
            Container(margin :EdgeInsets.only(top:30,bottom: 100),child: ElevatedButton(
              child: Text('OutputListに追加'), style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {Add();},)),
          ],),),);
  }

 Future<void> Add() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   var aa =  prefs.getStringList("アウトプット")??[];aa.add(widget.text);ID =  prefs.getString("ID")!;
   prefs.setStringList("アウトプット", aa);map = {"題名":item[0],"星":0,"メモ":"","内容":item[1]};
   FirebaseFirestore.instance.collection('users').doc(ID).update({"アウトプット": FieldValue.arrayUnion([map]),});

 }
  Future<void> Saw() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("Saw")??[];aa.add(widget.text);
    prefs.setStringList("Saw", aa);
  }

  void itemSet () {
    setState(() {
      switch (widget.text) {
        case "コーヒーのNGとメリット" :
          item = ["コーヒーのNGとメリット", "美味しい"];
      }});}


  }









