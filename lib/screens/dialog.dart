import 'package:flutter/material.dart';

import 'dart:io';

import 'package:yasha_khan/screens/home.dart';

class dialog extends StatefulWidget {
  File? image;
  dialog({super.key,this.image});

  @override
  State<dialog> createState() => _dialogState();
}

class _dialogState extends State<dialog> {
  
 
  String? shape;
  List list=['assets/images/s1.png','assets/images/s2.png','assets/images/s3.png','assets/images/s4.png'];
  List shapelist=['heart','square','circle','rectangle'];


  
  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Container(height: hght*0.4,child: Dialog(child: Column(children: [
    SizedBox(height: 30,),
    SizedBox(child: Text('Uploaded image',style: TextStyle(fontSize: 25),),),
    SizedBox(height: 20,),
    Container(height:150,width: 100,child: Image.file(widget.image!,fit: BoxFit.cover,),),
    SizedBox(height: 20,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    
    SizedBox(width: 10,),
     Container(height: wid*0.1,width: wid*0.2,decoration: BoxDecoration(border: Border.all(color:Colors.black ),borderRadius: BorderRadiusDirectional.circular(10)),
       child:  InkWell(
        onTap: (){
          print('original selected');
          setState(() {
            shape='';
          });
        },
        child: Text('Original',style: TextStyle(fontSize: 15),),),),
     Container(height: wid*0.1,width: wid*0.1,decoration: BoxDecoration(border: Border.all(color:Colors.black ),borderRadius: BorderRadiusDirectional.circular(10)),
       child: InkWell(
        onTap: (){
          print('heart selected');
          setState(() {
            shape=shapelist[0];});},
        child: Image.asset(list[0]),),),
     Container(height: wid*0.1,width: wid*0.1,decoration: BoxDecoration(border: Border.all(color:Colors.black ),borderRadius: BorderRadiusDirectional.circular(10)),
       child: InkWell(
        onTap: (){
          print('square selected');
          setState(() {
           shape=shapelist[1];});},
        child: Image.asset(list[1]),),),
     Container(height: wid*0.1,width: wid*0.1,decoration: BoxDecoration(border: Border.all(color:Colors.black ),borderRadius: BorderRadiusDirectional.circular(10)),
       child: InkWell(
        onTap: (){
          print('circle selected');
          setState(() {
            shape=shapelist[2];});},
        child: Image.asset(list[2]),),),
     Container(height: wid*0.1,width: wid*0.1,decoration: BoxDecoration(border: Border.all(color:Colors.black ),borderRadius: BorderRadiusDirectional.circular(10)),
       child: InkWell(
        onTap: (){
          print('rectangle selected');
          setState(() {
           shape=shapelist[3];});},
        child: Image.asset(list[3]),),),
      SizedBox(width: 10,), 

    ],),
    SizedBox(height: 20,),
    ElevatedButton(onPressed: (){
      print('added successfully');
       
    Navigator.push(context, MaterialPageRoute(builder: (context) =>home(shape: shape,backimage:widget.image)));
    }, child:Text('Use this image'))
  ],),));
  }
}