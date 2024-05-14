import 'dart:io';
void main()
{
    print("Enter your age");
    int age = int.parse(stdin.readLineSync().toString());
    String message = '';
    // if(age>=18)
    // {
    //     message = 'you are eligible for applying driving licence and votter-id card';
    // }
    // else 
    // {
    //     message = 'enjoy cartoons';
    // }
    message = (age>=18) ? 'you are eligible for applying driving licence and votter-id card' : 'enjoy cartoons';
    print(message);
    var ICanBeNull = 'Bharat';
    var IAlwaysHaveValue = "India";
    var WhatDoIHave = ICanBeNull ?? IAlwaysHaveValue;
    print(WhatDoIHave);

}