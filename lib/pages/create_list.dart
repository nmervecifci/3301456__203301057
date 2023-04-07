import 'package:flutter/material.dart';

class CreateList extends StatefulWidget {
  const CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  final _listName = TextEditingController();
  List<TextEditingController> wordTextEditingList=[];
  List<Row> wordListField=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i =0;i<10;++i)
    wordTextEditingList.add(TextEditingController());

    for(int i=0;i<5;++i)
    {
      debugPrint("===>"+(2*i).toString()+ "    " +(2*i+1).toString());
      wordListField.add(
        Row(
          children: [
            Expanded(child:textFieldBuilder(textEditingController: wordTextEditingList[2*i])),
            Expanded(child:textFieldBuilder(textEditingController: wordTextEditingList[2*i+1])),
          ],
        )
      );
    }
  }

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
                  child: InkWell(
                    onTap: () {
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
                  child: Image.asset("lib/assets/images/logo_text.png")),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.20,
                child: Image.asset(
                  "lib/assets/images/logo.jpg",
                  height: 35,
                  width: 35,
                ),
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
              textFieldBuilder(
                  icon: Icon(Icons.list, size: 18),
                  hintText: "Liste Adı",
                  textEditingController: _listName,
                  textAlign: TextAlign.left),
                  Container(
                   margin: EdgeInsets.only(top: 20,bottom: 10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("İngilizce",style: TextStyle(fontSize: 18,fontFamily: "RobotoRegular"),),
                      Text("Türkçe",style: TextStyle(fontSize: 18,fontFamily:"RobotoRegular"),),
                    ],
                   ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: wordListField,

                        
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      actionBtn(addRow,Icons.add),
                      actionBtn(save,Icons.save),
                      actionBtn(deleteRow,Icons.remove),
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }

  InkWell actionBtn(Function()click,IconData icon) {
    return InkWell(
      onTap: () => click(),
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.all(5),
                        child: Icon(icon,size: 28,),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
  }
void addRow(){
               wordTextEditingList.add(TextEditingController());
                wordTextEditingList.add(TextEditingController());

                wordListField.add(
                  Row(
                    children: [
                      Expanded(child:textFieldBuilder(textEditingController: wordTextEditingList[wordTextEditingList.length-2])),
                      Expanded(child:textFieldBuilder(textEditingController: wordTextEditingList[wordTextEditingList.length-1])),
                    ],
                  ),
                );
                setState(()=>wordListField);
}
void save(){
   for(int i =0;i<wordTextEditingList.length/2;++i)
   {
   String eng=wordTextEditingList[2*i].text;
   String tr=wordTextEditingList[2*i+1].text;

   if(!eng.isEmpty||!tr.isEmpty)
   debugPrint(eng+"<<<<<<>>>>>>" +tr);
   else
   debugPrint("boş bırakılan alan");
   }
}
void deleteRow(){
if(wordListField.length!=1)
{
 wordTextEditingList.removeAt(wordTextEditingList.length-1);
 wordTextEditingList.removeAt(wordTextEditingList.length-1);

 wordListField.removeAt(wordListField.length-1);

    setState(()=>wordListField);
}
else 
{
  print("son bir eleman");
}
}
  Container textFieldBuilder(
      {int height = 40,
      @required TextEditingController? textEditingController,
      Icon? icon,
      String? hintText,
      TextAlign textAlign = TextAlign.center}) {
    return Container(
      height: double.parse(height.toString()),
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 4),
      child: TextField(
        keyboardType: TextInputType.name,
        maxLines: 1,
        textAlign: textAlign,
        controller: textEditingController,
        style: TextStyle(
          color: Colors.black,
          fontFamily: "RobotoMedium",
          decoration: TextDecoration.none,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hintText,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
