import 'package:atividade/pages/home_page.dart';
import 'package:flutter/material.dart';

void main()=> runApp( MyApp());
  
class MyApp extends MaterialApp {
   MyApp({super.key}) : super(
    home: Homepage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark),
    );
}