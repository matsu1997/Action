import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class V4V2 extends StatefulWidget {
 V4V2(this.map,this.All,this.co);
 Map map;List All;int co;
  @override
  State<V4V2> createState() => _V4V2State();
}

class _V4V2State extends State<V4V2> {
  var item = ["タイマー","if-thenルール","日記",""];
  var item1 = [];var map = {};
  var text = "完了";var textBool = true;
  var text2 = "";
  var name = "aaa";
  var ID = "";
  var hint = "";var rate = 0.0;
  late TextEditingController _bodyController;


  void initState() {
    super.initState();_bodyController = TextEditingController();
    set ();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.black),
          title:  Text(widget.map["日付"], style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold,), textAlign: TextAlign.center,), elevation: 0,
          actions: <Widget>[TextButton(onPressed: () {Add();},child: Text(text, style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),)],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {Theme();}, backgroundColor: Colors.green, child:Text("お題"),),
        body:GestureDetector(
    behavior: HitTestBehavior.opaque, //画面外タップを検知するために必要
    onTap: () => FocusScope.of(context).unfocus(),
    child: Column(children:[
          Container(margin :EdgeInsets.only(top: 30),child:Text("今日の評価",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
          Container(child: RatingBar.builder(itemBuilder: (context, index) =>  Icon(Icons.star, color: Colors.yellow,),allowHalfRating: true,
              initialRating:widget.map["評価"], onRatingUpdate: (rating) {rate = rating;},)),
          Container(margin :EdgeInsets.only(top: 30),child:Text("どんな一日だった?",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,)),
          Expanded(child: Container(height: double.infinity,width: double.infinity,margin:EdgeInsets.all(10), decoration: BoxDecoration(color:Colors.grey[50],borderRadius: BorderRadius.circular(20),),
            child: TextField( style: TextStyle(color: Colors.black,height: 2),enabled: textBool,maxLines: null,controller: _bodyController, decoration: InputDecoration(border: InputBorder.none, hintText: hint ),onChanged: (String value) {name = value;},),)),

         ])));
  }



  void Theme(){  for (var i = 0; i < item.length; i++) {var random = math.Random();text2 = item[random.nextInt(item.length)];}
  showDialog(context: context, builder: (context) =>  AlertDialog(title: Text(text2,style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),));}

  Future<void> Add() async {
    widget.map["評価"] = rate;widget.map["内容"] = name;
     SharedPreferences prefs = await SharedPreferences.getInstance();ID =  prefs.getString("ID")!;
    widget.All[widget.co] = widget.map;
  FirebaseFirestore.instance.collection('users').doc(ID).update({"日記": widget.All,});
  }

  void set (){setState(() {
    if (widget.map["内容"] == ""){
     hint = "頑張ったこと、不安なことなど\n今日と言う日を振り返ってみましょう\n\n\n\n\n\n半年・1年後にもう一度見てみましょう。\nきっと今日の悩みは大したこと無いはず";
    }else{
      _bodyController.text = widget.map["内容"];
      hint = widget.map["内容"];
      rate = widget.map["評価"];
    }
  });}
}
