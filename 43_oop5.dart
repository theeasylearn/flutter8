import 'dart:io';
class MyTime 
{
    //private variable 
    int _seconds=0;
    set seconds(int sec)
    {
        if(sec<0)
            sec = 0 - sec;
        _seconds = sec;
    }
    int get seconds
    {
        return _seconds;
    }
    String get minutes 
    {
        return (_seconds/60).toStringAsFixed(2);
    }
    String get hours
    {
        return ((_seconds/60)/60).toStringAsFixed(2);
    }
}
void main()
{
    MyTime m1 = new MyTime();
    print("Enter time to complete task in seconds");
    m1.seconds = int.parse(stdin.readLineSync().toString());
    print("seconds " + m1.seconds.toString());
    print("minutes " + m1.minutes);
    print("hours " + m1.hours);
}