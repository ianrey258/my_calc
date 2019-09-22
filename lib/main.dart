import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String,WidgetBuilder>{
        'page2':(BuildContext context) => MyHomePage2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  Calculator1 createState() => Calculator1();
}
class MyHomePage2 extends StatefulWidget {
  @override
  Calculator2 createState() => Calculator2();
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
class Calculator2 extends State<MyHomePage2>{
  String resvalue ="",opt;
  num result = 0;
  double textsize=6.0;
  //for Operation button
  Widget optButton(String _text,double _height){
    return Container(
      margin: EdgeInsets.all(1),
      height: _height,
      child: FlatButton(onPressed: (){setInput(_text);},child: Text("$_text",textScaleFactor: 2.0,),color: Color.fromRGBO(13,13,255,0.2)),
    );
  }
  Widget numButton(String _text,double _height){
    return Container(
      margin: EdgeInsets.all(5),
      height: _height,
      child: RaisedButton(onPressed: (){setInput(_text);},child: Text("$_text",textScaleFactor: 1.0,),color: Color.fromRGBO(22, 124, 250, .5),)
    );
  }
  String linearCheck(String equation){
    resvalue = "";
    for(int i=0;i<equation.length;i++){
      if(equation[i]=='+'||equation[i]=='-'||equation[i]=='*'||equation[i]=='/'||equation[i]=='%'){
        if(opt == '+'||opt == '-'||opt == '*'||opt == '/'||opt == '%'){
          result = calculation(result, resvalue, opt);
          resvalue = "";
        }
        else{
          result = num.parse(resvalue);
          resvalue = "";
        }
        opt = equation[i];
      }
      else{
        if(i == equation.length-1){
          resvalue += equation[i];
          resvalue = calculation(result, resvalue, opt).toString();
        }
        else{
          resvalue += equation[i];
        }
      }
    }
    opt ="";
    return resvalue;
  }
  num calculation(num result,String resvalue,String opt){
    if(opt == '+'){
      result = num.parse(resvalue) + result;
    }
    else if(opt == '-'){
      result = result - num.parse(resvalue);
    }
    else if(opt == '*'){
      result = num.parse(resvalue) * result;
    }
    else if(opt == '/'){
      result = num.parse(resvalue) / result;
    }
    else if(opt == "%"){
      result = (num.parse(resvalue)/100) * result;
    }
    return result;
  }
  void setInput(String inputs){
    setState(() {
      if(inputs == "=" && resvalue != ""){
        if(resvalue[resvalue.length-1] != "+"||resvalue[resvalue.length-1] != "-"||resvalue[resvalue.length-1] != "/"||resvalue[resvalue.length-1] != "*"||resvalue[resvalue.length-1] != "%"){
          resvalue = linearCheck(resvalue);
        }
      }
      else if(inputs == "AC"){
        resvalue="";
        result=0;
        opt="";
      }
      else if(inputs == "←"){
        if(resvalue != ""){
          String temp = "";
          for(int i=0;i<resvalue.length-1;i++){temp+=resvalue[i];}
          resvalue = temp;
        }
      }
      else if(inputs == "+"||inputs == "-"||inputs == "/"||inputs == "*"||inputs == "%"||inputs == "." && resvalue != ""){
        if(resvalue[resvalue.length-1] == "+"||resvalue[resvalue.length-1] == "-"||resvalue[resvalue.length-1] == "/"||resvalue[resvalue.length-1] == "*"||resvalue[resvalue.length-1] == "%"||resvalue[resvalue.length-1] == "." && resvalue != ""){
          String temp = "";
          for(int i=0;i<resvalue.length-1;i++){temp+=resvalue[i];}
          temp+=inputs;
          resvalue = temp;
        }
        else{
          resvalue+=inputs;
        }
      }
      else{
        if(inputs != "=" && inputs != "."){
           resvalue+=inputs;
        }
      }changeSize();
    });
  }
  void changeSize(){
    setState(() {
      if(resvalue.length <= 10){
        double tsize = 4.5;int len =10;
        for(int i=0;i<resvalue.length;i++){
          if(i == len){
          tsize -= 0.5;len += 5;
        }  
      }
      textsize = tsize;
      }
      else{
        textsize = 6;
      }
    });
  }

  //Calculator 2 build_context
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator 2'),
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
                    child: Text('$resvalue',textDirection: TextDirection.rtl,textScaleFactor: textsize),
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
                      optButton("←", 80),
                      optButton("-", 80),
                      optButton("+", 80),
                      optButton("=", 126),
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
