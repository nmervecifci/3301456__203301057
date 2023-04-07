import 'package:flutter/material.dart';
import 'package:kelimeezberleme/pages/lists.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum Lang { eng, tr }

class _MainPageState extends State<MainPage> {
  Lang? _chooseLang = Lang.eng;

 final GlobalKey<ScaffoldState>_scaffoldKey=new  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key :_scaffoldKey,
      drawer: Container(
        width: MediaQuery.of(context).size.width*0.5,
        color:  Colors.white,
      ),
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
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(onTap:() {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                    child: Icon(
                      Icons.drag_handle,
                      color: Colors.black,
                      size: 32,
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Image.asset("lib/assets/images/logo_text.png")),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              langRadioButton(
                  titleWidget: Text("İngiilizce-Türkçe"),
                  group: _chooseLang,
                  value: Lang.tr),
              langRadioButton(
                  titleWidget: Text("Türkçe-İngilizce"),
                  group: _chooseLang,
                  value: Lang.eng),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPage()));
                },
                child: Container(
              
                  alignment: Alignment.center,
                  height: 55,
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text("Listelerim", style: TextStyle(fontSize: 24,fontFamily:"Carter",color: Colors.white)
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                  alignment: Alignment.center,
                  height: 200,
                  width:140,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text("Kelime Kartları", style: TextStyle(fontSize: 24,fontFamily:"Carter",color: Colors.white),textAlign: TextAlign.center,
                  ),
                ),
                 Container(
                  alignment: Alignment.center,
                  height: 200,
                  width:140,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text("Çoktan Seçmeli", style: TextStyle(fontSize: 24,fontFamily:"Carter",color: Colors.white),textAlign: TextAlign.center,
                  ),
                ),
                  ],
                ),
              )
            ],
          ),
        ),
       
      ),
    );
  }

  SizedBox langRadioButton({
    @required Widget? titleWidget,
    @required Lang? value,
    @required Lang? group,
  }) {
    return SizedBox(
      width: 250,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: titleWidget,
        leading: Radio<Lang>(
          value: Lang.tr,
          groupValue: _chooseLang,
          onChanged: (Lang? value) {
            setState(() {
              _chooseLang = value;
            });
          },
        ),
      ),
    );
  }
}
