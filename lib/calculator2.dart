import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  Calculator2 createState() => Calculator2();
}


class Calculator2 extends State<MyHomePage2>{
  String resvalue ="";
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
    String opt,value = "";
    for(int i=0;i<equation.length;i++){
      if(equation[i]=='+'||equation[i]=='-'||equation[i]=='*'||equation[i]=='/'||equation[i]=='%'){
        if(opt == '+'||opt == '-'||opt == '*'||opt == '/'||opt == '%'){
          result = calculation(result, num.parse(value), opt);
        }
        else{
          result = num.parse(value);
        }
        value = "";
        opt = equation[i];
      }
      else{
        if(i == equation.length-1){
          value += equation[i];
          value = calculation(result, num.parse(value), opt).toString();
        }
        else{
          value += equation[i];
        }
      }
    }
    return value;
  }
  num calculation(num result,num resvalue,String opt){
    if(opt == '+'){
      result += resvalue;
    }
    else if(opt == '-'){
      result = result - resvalue;
    }
    else if(opt == '*'){
      result *= resvalue;
    }
    else if(opt == '/'){
      result = result / resvalue;
    }
    else if(opt == "%"){
      result *= (resvalue/100);
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
      if(resvalue.length > 7){
        int len = 7;double size = 6;
        for(int i=0;i<resvalue.length;i++){
          if(i==len && len<12){
            size -= 1;len += 2;
            if(len>12){
              len = 30;
            }
          }
          else if(i==len && len>=30){
            size -= 1;len += 40;
          }
        }
      textsize = size;
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
                children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 100,
                    child: Text('$resvalue',textDirection: TextDirection.rtl,textScaleFactor: textsize,),
                  ),
                ),
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