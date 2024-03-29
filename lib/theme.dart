
import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    primarySwatch:Colors.teal,
    primaryColorDark:Color.fromARGB(255, 16, 56, 55),
    primaryColor:Color.fromARGB(255, 39, 116, 115),
    primaryColorLight: Color.fromARGB(255, 40, 160, 158),
    fontFamily: AutofillHints.birthdayYear,
    textTheme:  TextTheme(
            headline1: TextStyle(fontSize: 20,color: Colors.amber),
            headline2: TextStyle(fontSize: 10,color:Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width:1,color: Colors.black,),),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width:3,color: Colors.black)),),
  );
}