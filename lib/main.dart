import 'package:flutter/material.dart';
import 'package:kelimeezberleme/pages/temprory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelime Ezberleme Uygulaması',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  TemproryPage(),
    );
  }
}

