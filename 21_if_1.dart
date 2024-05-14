//write a program to calculate & display cube of given positive number
import 'dart:io';
void main()
{
    print("Enter positive number");
    int number = int.parse(stdin.readLineSync().toString()); //-15
    int qube;
    if(number<0) // == != > >= < >=
    {
        number = 0 - number; //15
        print("your number was negative so converted into positive");
    }
    qube = number * number * number;
    print(qube);
}