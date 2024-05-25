import 'dart:io';
//without return value with argument function
void printLine(String letter, int HowManyTimes)
{
    for(int i=1;i<=HowManyTimes;i++)
    {
     stdout.write(letter);
    }
    print("");
}
void printMessage(String message)
{
    printLine('*',100);
    print(message);
    printLine('-',100);
}
//withtout argument without return value 
void displayCurrentTime()
{
    DateTime now = new DateTime.now();
    String currenttime = now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString();
    print(currenttime);
}
//with return value without argument
String getCurrentDate()
{
     DateTime now = new DateTime.now();
     String currentdate = now.day.toString() + "/" + now.month.toString() + "/" + now.year.toString();
     return currentdate;
}
void main()
{
    print("Enter your name");
    String name = stdin.readLineSync().toString();
    printMessage(name);
    displayCurrentTime();
    String currentdate = getCurrentDate();
    print(currentdate);
}
