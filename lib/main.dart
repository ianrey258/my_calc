import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'My Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String value = "",opt1;
  int resvalue = 0;
  

  void calcu(String opt){
    setState(() {
    if(resvalue == 0){resvalue = int.parse(value);opt1 = opt;}
     else if(opt == "+"){value = (int.parse(value) + resvalue).toString();opt1 = "+";}
     else if(opt == "-"){value = (int.parse(value) - resvalue).toString();opt1 = "-";} 
     else if(opt == "="){calcu(opt);}
    });
  }
  void clear() => setState((){value = "";resvalue=0;});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 100,
                    child: Text('$value',textDirection: TextDirection.rtl,textScaleFactor: 5.5,),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FlatButton(onPressed: (){},child: Text("%",textScaleFactor: 1.0,),),
                    FlatButton(onPressed: (){setState(() {value += "7";});},child: Text("7",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "4";});},child: Text("4",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "1";});},child: Text("1",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: clear,child: Text("AC"),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(onPressed: (){},child: Text("/",textScaleFactor: 1.0,),),
                    FlatButton(onPressed: (){setState(() {value += "8";});},child: Text("8",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "5";});},child: Text("5",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "2";});},child: Text("2",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "0";});},child: Text("0",textScaleFactor: 2.0,),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(onPressed: (){},child: Text("*",textScaleFactor: 1.0,),),
                    FlatButton(onPressed: (){setState(() {value += "9";});},child: Text("9",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "6";});},child: Text("6",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += "3";});},child: Text("3",textScaleFactor: 2.0,),),
                    FlatButton(onPressed: (){setState(() {value += ".";});},child: Text(".",textScaleFactor: 2.0,),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(onPressed: (){},child: Text("-",textScaleFactor: 1.0,),),
                    FlatButton(onPressed: (){},child: Text("+",textScaleFactor: 1.0,),),
                    FlatButton(onPressed: null,child: Text(""),),
                    FlatButton(onPressed: null,child: Text(""),),
                    FlatButton(onPressed: (){},child: Text("=",textScaleFactor: 1.5,),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ) 
    );
  }
}
