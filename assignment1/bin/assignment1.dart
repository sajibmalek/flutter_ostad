main(){
  var phoneNumber=[
    '+88',
     '01768131685',
     '01768171985',
     '01768111286',
     '01768131685'
  ];
  ///printing all number in given list
  print('\n');
  print('Full List Number');
  print(phoneNumber);
  print('\n');
  /// Check & print country code before the number
  /// if number has +880 print without +88
  /// else add +88
  ///
print('with +88 number');
  for(var i=0; i<=4;i++){
if(phoneNumber.length==11){
  continue;
}
    else{
      if(phoneNumber[i].length==14){
      //  print(phoneNumber[i]);
      }else{
        if(phoneNumber[i]=='+88'){
          continue;
        }
        print('+88${phoneNumber[i]}');
      }
    }
  }
print('\n');
  print('without +88 //////');
  var i=0;
  for(i; i<5;i++){
  if(phoneNumber[i]=='+88'){

    continue;
   

   }


   print(phoneNumber[i]);

  }
}