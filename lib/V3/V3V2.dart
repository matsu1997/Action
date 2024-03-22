import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../V1/V1.dart';
class V3V2 extends StatefulWidget {
  V3V2(this.map,this.All,this.co);
  Map map;List All;int co;
  @override
  State<V3V2> createState() => _V3V2State();
}

class _V3V2State extends State<V3V2> {//"",
  var item = ["勉強25分","休憩5分","勉強25分","休憩5分","勉強25分","休憩5分",];
  var item2 = ["休憩5分",];
  var time = "00:00:00";
  var text = "";var text2 = "";var ID ="";
  TimeOfDay _time = new TimeOfDay.now();
  var map = {};
  late TextEditingController _bodyController;
  
  
  void initState() {
    super.initState();_bodyController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,iconTheme:IconThemeData(color: Colors.black) ,
        title:  Text(widget.map["ルーティン名"], style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold,), textAlign: TextAlign.center,), elevation: 0,
      //  actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {firebase();}, backgroundColor: Colors.green, child: Text("更新"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("開始時間を設定",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 20),child:TextButton(onPressed: () { _selectTime(context);}, child: Text(widget.map["開始時間"],style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),)),
             ],),
            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("ルーティンを細かく決める",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {add();}, icon: Icon(Icons.add_task,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.only(top:0,left: 20),alignment:Alignment.bottomLeft,child:Text("",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
            Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
              itemCount: widget.map["ルーティン"].length, itemBuilder: (context, index) {
                return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                  title: Text(widget.map["ルーティン名"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                  onTap: (){},
                ),);},),),
            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("知識を追加",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1({"知識":widget.map["知識"],"番号":1})));}, icon: Icon(Icons.bookmark_add,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
              itemCount: widget.map["知識"].length, itemBuilder: (context, index) {
                return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                  title: Text(widget.map["知識"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2({"知識":widget.map["知識"],"番号":2},widget.map["知識"][index])));},
                ),);},),),
            Row(children: [
            Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("メモ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {add2();}, icon: Icon(Icons.add_box_outlined,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.only(top:10,left: 30),width:double.infinity,child:Text(widget.map["メモ"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(height: 30,)
          ],),),);
  }
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: _time,);
    if (picked != null) setState(() {_time = picked; widget.map["開始時間"] = _time.format(context);});
  }

  Future<void> add() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('ルーティン追加',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, ),onChanged: (String value) {text = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {widget.map["ルーティン"].add(text);item.add(text);_bodyController.clear();;Navigator.pop(context);});})),
        ],)],));
  }
  Future<void> add2() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('メモ',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, ),onChanged: (String value) {text2 = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {widget.map["メモ"] = text2;_bodyController.clear();Navigator.pop(context);});})),
        ],)],));
  }
  Future<void> firebase() async {
    widget.All[widget.co] = widget.map;
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    FirebaseFirestore.instance.collection('users').doc(ID).update({"ルーティン":widget.All});
  }
}



class V3V22 extends StatefulWidget {
  V3V22(this.map,this.All,this.co);
  Map map;List All;int co;
  @override
  State<V3V22> createState() => _V3V22State();
}

class _V3V22State extends State<V3V22> {//"",
  var item = ["勉強25分","休憩5分","勉強25分","休憩5分","勉強25分","休憩5分",];
  var item2 = ["休憩5分",];
  var time = "00:00:00";
  var text = "";var text2 = "";var ID ="";
  TimeOfDay _time = new TimeOfDay.now();
  var map = {};
  late TextEditingController _bodyController;


  void initState() {
    super.initState();_bodyController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,iconTheme:IconThemeData(color: Colors.black) ,
        title:  Text("", style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold,), textAlign: TextAlign.center,), elevation: 0,
        //  actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.info_outline,color: Colors.black87,))],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {firebase();}, backgroundColor: Colors.green, child: Text("更新"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("if",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 20),child:TextButton(onPressed: () {}, child: Text(widget.map["if"],style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),)),
            ],),
            Container(margin:EdgeInsets.only(top:0,left: 20),alignment:Alignment.bottomLeft,child:Text("↓",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
            Row(children: [
              Container(margin:EdgeInsets.only(top:0,left: 20),alignment:Alignment.bottomLeft,child:Text("then",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:0,left: 20),child:TextButton(onPressed: () {}, child: Text(widget.map["then"],style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),)),
            ],),

            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("知識を追加",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1({"知識":widget.map["知識"],"番号":1})));}, icon: Icon(Icons.bookmark_add,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
              itemCount: widget.map["知識"].length, itemBuilder: (context, index) {
                return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                  title: Text(widget.map["知識"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2({"知識":widget.map["知識"],"番号":2},widget.map["知識"][index])));},
                ),);},),),
            Row(children: [
              Container(margin:EdgeInsets.only(top:30,left: 20),alignment:Alignment.bottomLeft,child:Text("メモ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.only(top:30,left: 10),child: IconButton( onPressed: () {add();}, icon: Icon(Icons.add_box_outlined,color: Colors.orange,size: 30,))),
            ],),
            Container(margin:EdgeInsets.only(top:10,left: 30),width:double.infinity,child:Text(widget.map["メモ"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(margin :EdgeInsets.only(top:100),width:100,child: ElevatedButton(
              child: Text('削除する'), style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {},)),
            Container(height: 30,)
          ],),),);
  }


  Future<void> add() async {
    showDialog(context: context, builder: (context) =>  AlertDialog(title: Text('メモ',style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: double.infinity,margin:EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5),),
            child: TextField(maxLines: null,controller: _bodyController,decoration: InputDecoration(border: InputBorder.none, ),onChanged: (String value) {text2 = value;},),),
          Container(margin :EdgeInsets.all(10),width:100,child: ElevatedButton(child: Text('追加'), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
              onPressed: () {setState(() {widget.map["メモ"] = text2;_bodyController.clear();Navigator.pop(context);});})),
        ],)],));
  }
  Future<void> firebase() async {
    widget.All[widget.co] = widget.map;
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    FirebaseFirestore.instance.collection('users').doc(ID).update({"if":widget.All});
  }
}



