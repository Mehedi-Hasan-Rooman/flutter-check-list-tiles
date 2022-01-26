import 'package:flutter/material.dart';
import 'package:flutter_checkboxlisttile/checkModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home_Page(),
    );
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  List <CheckModel> modeldata = [];
  bool allanswer = false;

  _Home_PageState(){
    modeldata.add(CheckModel(title: 'Hello 1',id: 1,seleceted: false));
    modeldata.add(CheckModel(title: 'Hello 2',id: 2,seleceted: false));
    modeldata.add(CheckModel(title: 'Hello 3',id: 3,seleceted: false));
    modeldata.add(CheckModel(title: 'Hello 4',id: 4,seleceted: false));
    modeldata.add(CheckModel(title: 'Hello 5',id: 5,seleceted: false));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          CheckboxListTile(
            title: Text('All check'),
              value: allanswer,
              onChanged: (value){
                setState(() {
                  allanswer = value!;
                  modeldata.forEach((element) {
                    element.seleceted = value;
                  });

                });
              }),

          ListView.builder(
            shrinkWrap: true,
              itemCount: modeldata.length,
              itemBuilder: (context,index){
                return CheckboxListTile(
                  checkColor: Colors.black,
                  activeColor: Colors.pinkAccent,
                  title: Text('${modeldata[index].title}'),
                  value: modeldata[index].seleceted,
                  onChanged: (value){
                   setState(() {
                     modeldata[index].seleceted = value;

                     final check = modeldata.every((element) => element.seleceted!);
                      allanswer = check;

                   });
                  },
                );
              })
        ],
      ),
    );
  }
}
