

import 'package:flutter/material.dart';
import 'package:kelimeezberleme/pages/main.dart';

class TemproryPage extends StatefulWidget {
  const TemproryPage({super.key});

  @override
  State<TemproryPage> createState() => _TemproryPageState();
}


class _TemproryPageState extends State<TemproryPage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2),(){
     
       Navigator.pushReplacement(context as BuildContext,MaterialPageRoute(builder: (context)=>MainPage()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("lib/assets/images/logo.jpg",width: 100,height: 100,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("QUEZY",style: TextStyle(color: Colors.black,fontFamily: "Luck",fontSize: 40),),
              ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("İstediğini Öğren !",style: TextStyle(color: Colors.black,fontFamily: "Carter",fontSize: 25),),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}