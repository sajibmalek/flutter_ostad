main(){
  var phoneNumber=[
    '+8801712348381',
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
if(phoneNumber.length==14){
  continue;
}
    else{
      if(phoneNumber[i].length==14){
       print(phoneNumber[i]);
      }else{
        print('+88${phoneNumber[i]}');
      }
    }
  }
print('\n');
  print('without +88 ');
  var i=0;
  for(i; i<4;i++){
   if(phoneNumber[i]=='+8801712348381'){
     phoneNumber[i]='01712348381';
     print(phoneNumber[i]);
   }
  }
}