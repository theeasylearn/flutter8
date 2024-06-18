import 'dart:io';
//optional positional  argument 
double getVolume(double height,[double width=1,double deapth=1])
{
    double volume = height * width * deapth;
    return volume;
}
//optional named  argument 
void printLine(String letter,{int HowManyTimes=100,bool isAddNewLine=true})
{
    for(int i=1;i<=HowManyTimes;i++)
    {
     stdout.write(letter);
    }
    if(isAddNewLine == true)  print("");
}
void main()
{
    double volume = getVolume(10.0,20.0,30.0);
    printLine('-',isAddNewLine:true);
    print(volume);
    volume = getVolume(10.0,20.0);
    printLine('=',isAddNewLine:false);
    print(volume);
    volume = getVolume(10.0);
    printLine('!',HowManyTimes:80);
    print(volume);
    printLine("^");
}