
main(){
  String equation = "";
  print(checklenght(equation));
  
}
//checking corresponding String and Operators to be Calculated
String checklenght(String equation){
  String resvalue ="",opt;
  num result = 0;
  for(int i=0;i<equation.length;i++){
    if(equation[i]=='+'||equation[i]=='-'||equation[i]=='*'||equation[i]=='/'){
      if(opt == '+'||opt == '-'||opt == '*'||opt == '/'){
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
  return result;
}


