import 'package:flutter/material.dart';

const kMainColor = Color(0xffd3d7d6);
const kYellowColor = Color(0xffE7D061);
const kOrangeColor = Color(0xffdf9047);
const kPurpleColor = Color(0xff9f758b);
const kBlueColor = Color(0xff93afc0);
const kBlackColor = Colors.black;
const kWhiteColor = Colors.white;

const kTextMainTitle = TextStyle(fontFamily:'RobotoCondensed',fontSize: 25, fontWeight: FontWeight.w900, color: kBlackColor);
const kTextSubTitle = TextStyle(fontFamily:'RobotoCondensed',fontSize: 20, fontWeight: FontWeight.w700);
const kTextinParagraph= TextStyle(fontFamily:'Relaway',fontSize: 16);



const kMainMargin = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

const kBoxLinearGradient = BoxDecoration(
    gradient:  LinearGradient(
        colors: [
           Color(0xffd3d7d6),
           Color(0xff93afc0),
        ],
        begin:  FractionalOffset(0.0, 0.0),
        end:  FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp));
