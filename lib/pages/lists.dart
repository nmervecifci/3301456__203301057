

import 'package:flutter/material.dart';
import 'package:kelimeezberleme/pages/create_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(onTap:() {
                    Navigator.pop(context);
                  },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 32,
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Image.asset("lib/assets/images/lists.png")),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.20,
                child: Image.asset("lib/assets/images/logo.jpg",height: 35,width: 35,),
              ),
            ],
          ),
        ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateList()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple.withOpacity(0.5),),
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.deepPurple,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Liste Adı",style: TextStyle(color: Colors.black,fontSize: 16),),
                         Text("305 terim",style: TextStyle(color: Colors.black,fontSize: 14),),
                          Text("5 öğrenildi",style: TextStyle(color: Colors.black,fontSize: 14),),
                          Text("300 öğrenilmedi",style: TextStyle(color: Colors.black,fontSize: 14),)
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.deepPurple,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Liste Adı",style: TextStyle(color: Colors.black,fontSize: 16),),
                         Text("305 terim",style: TextStyle(color: Colors.black,fontSize: 14),),
                          Text("5 öğrenildi",style: TextStyle(color: Colors.black,fontSize: 14),),
                          Text("300 öğrenilmedi",style: TextStyle(color: Colors.black,fontSize: 14),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      );
  }
}