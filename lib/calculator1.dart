import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  Calculator1 createState() => Calculator1();
}
class Calculator1 extends State<MyHomePage>{
  String value = "|",opt;
  bool rdy2input = false;
  double resvalue = 0;
  //for Operation button
  Widget optButton(String _text,double _height){
    return Container(
      margin: EdgeInsets.all(1),
      height: _height,
      child: FlatButton(onPressed: (){optFunction(_text);},child: Text("$_text",textScaleFactor: 2.0,),color: Color.fromRGBO(13,13,255,0.2)),
    );
  }
  Widget numButton(String _text,double _height){
    return Container(
      margin: EdgeInsets.all(5),
      height: _height,
      child: RaisedButton(onPressed: (){setInput(_text);},child: Text("$_text",textScaleFactor: 1.0,),color: Color.fromRGBO(22, 124, 250, .5),)
    );
  }
  //myFunctions
  void optFunction(String optype){
    setState(() {
      if(optype == "+" || optype == "-"|| optype == "/"|| optype == "*" || optype == "=" || optype == "%"){
        if(resvalue == 0 && value != "|"){
          resvalue = double.parse(value);
        }
        if(optype == "="){
          if(opt == "+"){
              value = (double.parse(value) + resvalue).toString();
          }
          else if(opt == "-"){
              value = (resvalue - double.parse(value)).toString();
          }
          else if(opt == "*"){
              value = (double.parse(value) * resvalue).toString();
          }
          else if(opt == "/"){
              value = (resvalue / (double.parse(value))).toString();
          }
          else if(opt == "%"){
              value = ((double.parse(value)/100) * resvalue).toString();
          }
        }
        else{
          opt = optype;
          resvalue = double.parse(value);
          rdy2input = true;
        }
      }
      else if(optype == "AC"){
        clear();
      }
      else if(optype == "." && double.parse(value) % 1 == 0){
        int.parse(value);
        value += ".";      
      }
    });
  }
  void setInput(String input){
    setState((){
      if(value=="|"){
        value = "";
        value+=input;
      }
      else{
        if(rdy2input == true){
          value = "";
          value+=input;
          rdy2input = false;
        }
        else{
          value+=input;
        }
      }});
  }
  void clear() => setState((){value = "|";resvalue=0;});
  
  //Overview App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator 1'),
        actions: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: FlatButton(onPressed: (){Navigator.pushNamed(context, 'page2');}, child: Text("↑↓",textScaleFactor: 1.5,),),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.white,
                    height: 100,
                    child: Text('$value',textDirection: TextDirection.rtl,textScaleFactor: 6.0,),
                  ),
                )
              ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      optButton("%", 80),
                      numButton("7", 60),
                      numButton("4", 60),
                      numButton("1", 60),
                      optButton("AC", 80),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      optButton("/", 80),
                      numButton("8", 60),
                      numButton("5", 60),
                      numButton("2", 60),
                      numButton("0", 71),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      optButton("*", 80),
                      numButton("9", 60),
                      numButton("6", 60),
                      numButton("3", 60),
                      optButton(".", 80),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      optButton("-", 80),
                      optButton("+", 80),
                      optButton("=", 209),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ) 
    );
  }
}
