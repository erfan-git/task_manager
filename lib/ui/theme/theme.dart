import 'package:flutter/material.dart';


final theme = ThemeData(
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.grey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'IranYekan',
  textTheme: TextTheme(
    // headline2: TextStyle(
    //     color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 24 .sp,),
    // subtitle1: TextStyle(
    //     color: Colors.grey,
    //     height: 1.5,
    //     fontWeight: FontWeight.w700,
    //     fontSize: 18.sp,),
    // subtitle2: TextStyle(
    //     color: Colors.grey,
    //     height: 1.5,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 16.sp,),
    // overline: TextStyle(
    //     color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12.sp,),
    // caption: TextStyle(
    //     color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 10.sp,),
    // bodyText1: TextStyle(
    //     color: Colors.grey,
    //     height: 1.5,
    //     fontWeight: FontWeight.w600,
    //     fontSize: 14.sp,),
    // bodyText2: TextStyle(
    //     color: darkGray,
    //     height: 1.5,
    //     fontWeight: FontWeight.w400,
    //     fontSize: 14.sp,),
  ),
);

OutlineInputBorder outLineInputBorder({bool focused = false}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
        color: focused ? Colors.blue : Colors.grey, width: 1.0),
  );
}

BoxDecoration cardMainBoxDecoration(){
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)),
      color: Colors.white);
}

BoxDecoration cardBoxDecoration(){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [buttonBoxShadow()]);
}

BoxDecoration cardBoxExpandleDecoration(){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [buttonBoxShadow()]);
}

BoxShadow buttonBoxShadow() {
  return BoxShadow(
    offset: const Offset(0.0, 6.0),
    blurRadius: 20.0,
    spreadRadius: 0,
    color: Colors.black.withOpacity(.1),
  );
}

BoxDecoration petInfoDecoration(){
  return BoxDecoration(
    border: Border.all(color: Colors.grey, width: 1),
    borderRadius: BorderRadius.circular(10),
    shape: BoxShape.rectangle,);
}
