import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class V2V2 extends StatefulWidget {
  V2V2(this.map,this.All);
  Map map;List All;

  @override
  State<V2V2> createState() => _V2V2State();
}

class _V2V2State extends State<V2V2> {
  var item = [];var map = {};
  var name = "";
  var text = "";var text2 = "";
  var ID = "";
  var co = 10;
  late TextEditingController _bodyController;
  late TextEditingController _bodyController2;

  void initState() {
    super.initState();_bodyController = TextEditingController();_bodyController2 = TextEditingController();
    set();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white,
        centerTitle: false,iconTheme: IconThemeData(color: Colors.black),
        title: Text("Title"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(margin:EdgeInsets.only(top: 0),alignment:Alignment.center,child:Text(widget.map["題名"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),

            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("評価",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {Review();}, icon: Icon(Icons.add_task,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.only(top:10,left: 30),width:double.infinity,child:Text(widget.map["星"].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),

            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("メモ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {add2();}, icon: Icon(Icons.add_box_outlined,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.only(top:10,left: 30),width:double.infinity,child:Text(widget.map["メモ"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),

            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("ルーティンに追加",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {add3();}, icon: Icon(Icons.add_box_outlined,color: Colors.orange,size: 30,))),
            ],),
            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("if-thenプランニングに追加",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {add4();}, icon: Icon(Icons.add_box_outlined,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.only(top:0,left: 20),alignment:Alignment.bottomLeft,child:TextButton(onPressed: () {},child: Text("if-thenプランニングとは?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),)),

          ],),),);
  }

   void set (){
     for(int i = 0; i<widget.All.length; i++){
     if(widget.All[i]["題名"] == widget.map["題名"] ){
       co = i;print(co);}
   }}

  Future<void> Add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    widget.map = {"題名":widget.map["題名"],"星":widget.map["星"],"メモ":widget.map["メモ"],"内容":widget.map["内容"]};
    widget.All[co] = widget.map;
    FirebaseFirestore.instance.collection('users').doc(ID).update({"アウトプット": widget.All,});
  }


  Future<void> add2() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('メモ',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, ),onChanged: (String value) {text = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {widget.map["メモ"] = text;Add();_bodyController.clear();Navigator.pop(context);});})),
        ],)],));
  }

  Future<void> add3() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('ルーティン',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none,hintText: "例:ベットメイキング" ),onChanged: (String value) {text = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {add3F();_bodyController.clear();Navigator.pop(context);});})),
        ],)],));
  }
  Future<void> add3F() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    map = {"ルーティン名":text,"知識":[],"開始時間":"","メモ":"","ルーティン":[]};
    FirebaseFirestore.instance.collection('users').doc(ID).update({"ルーティン": FieldValue.arrayUnion([map])});
    text = ""; }

  Future<void> add4() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('if-thenプランニング',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, hintText: "例:もしやる気が出ない時は"),onChanged: (String value) {text = value;},),),
          Container(margin:EdgeInsets.only(top:10,left: 20), child:Text("↓",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),),
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController2,decoration: InputDecoration(border: InputBorder.none, hintText: "例:スクワット10回"),onChanged: (String value) {text2 = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {add4F();_bodyController.clear();_bodyController2.clear();Navigator.pop(context);});})),
        ],)],));
  }
  Future<void> add4F() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    map = {"if":text,"then":text2};
    FirebaseFirestore.instance.collection('users').doc(ID).update({"if":FieldValue.arrayUnion([map]),});
    text = "";text2 = "";}


  void Review() {
    showModalBottomSheet(isScrollControlled: true,context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(child:SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {widget.map["星"] = 5;Add(); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★★★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {widget.map["星"] = 4;Add(); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {widget.map["星"] = 3;Add(); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {widget.map["星"] = 2;Add();},
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {widget.map["星"] = 1;Add(); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("★",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  //   Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "リセット";setState(() {widget.item = item0;}); },
                  //     child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("リセット",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                ],)),);});}, );}

}









