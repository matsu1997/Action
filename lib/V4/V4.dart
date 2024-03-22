import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'V4V2.dart';

class V4 extends StatefulWidget {

  @override
  State<V4> createState() => _V4State();
}

class _V4State extends State<V4> {
  // var item = ["タイマー","if-thenルール","日記",""];
  var item = [];var map = {};
  var item1 = [];
  DateTime _inputDate = DateTime.now();
  var ID = "";

  void initState() {
    super.initState();initializeDateFormatting('ja');
    set();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title:  Text("日記", style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold,), textAlign: TextAlign.center,), elevation: 0,
        actions: <Widget>[IconButton(onPressed: () {_openSample1(context);}, icon: Icon(Icons.calendar_month_rounded,color: Colors.green,))],
      ),

        floatingActionButton: FloatingActionButton(onPressed: () {Add();}, backgroundColor: Colors.green, child:Icon(Icons.edit_note),),
        body:Column(children: <Widget>[
          Container(margin:EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
            itemCount: item.length, itemBuilder: (context, index) {
              return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                title: Row(children: [
                  Container(width:70,padding:EdgeInsets.all(10),child: Column(children: [
                    Container(margin :EdgeInsets.only(top: 0),child:Text(item[index]["曜日"],style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 10),textAlign: TextAlign.center,)),
                    Container(margin :EdgeInsets.only(top: 5),child:Text(item[index]["日"],style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                    Container(margin :EdgeInsets.only(top: 5),child:Text(item[index]["年"],style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 10),textAlign: TextAlign.center,)),

                  ],),),
                  Expanded(child: Column(children: [
                    Container(alignment: Alignment.topRight,width: double.infinity,margin :EdgeInsets.only(top: 0),child:Text("★"+ item[index]["評価"].toString(),style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 10),textAlign: TextAlign.center,)),
                    Container(margin :EdgeInsets.only(left: 20),width: double.infinity,child:Text(item[index]["内容"],style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold,fontSize: 15),overflow: TextOverflow.ellipsis,)),
                      ],))
                ],),
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4V2(item[index],item,index)));},
              ),);},),),
      ]) );
  }

  Future _openSample1(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await showDatePicker(
      context: context,
      // （4） 処理指定日付
      initialDate: DateTime.now(),
      // （5） 指定できる日付範囲
      firstDate: DateTime(2024,1,1),
      lastDate: DateTime(2024,12,31),
    );
    // （6） 選択された場合に、値を設定する
    if(_date != null){setState(() {item = [];_inputDate = _date;DateFormat outputFormat = DateFormat('yyyy年MM月dd日');var date = outputFormat.format(_inputDate);
    for(int i = 0; i<item1.length; i++){if(item1[i]["日付"] == date){item.add(item1[i]);}}
    });}}

  Future<void> Add() async { DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('yyyy年MM月dd日');DateFormat outputFormat2 = DateFormat('MM/dd');DateFormat outputFormat3 = DateFormat('yyyy'); var date = outputFormat.format(now);
  final dateFormatForDayOfWeek = DateFormat.EEEE('ja');
  final formatStrForDayOfWeek = dateFormatForDayOfWeek.format(now);

  map = {"評価":0.0,"日付":date,"曜日":formatStrForDayOfWeek,"日":outputFormat2.format(now),"年":outputFormat3.format(now),"内容":""};
  SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
  FirebaseFirestore.instance.collection('users').doc(ID).update({"日記": FieldValue.arrayUnion([map]),});
  setState(() {item.add(map);item1.add(map);});
  }

  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    FirebaseFirestore.instance.collection('users').where("ID",isEqualTo: ID).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {setState(() { item = doc["日記"];item1 = doc["日記"];});
      });});}
}




