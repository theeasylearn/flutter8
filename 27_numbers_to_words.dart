import 'dart:io';
void main()
{
    print("Enter amount between 10 to 99");
    int number = int.parse(stdin.readLineSync().toString());
    
    if(number<10 || number>99)
    {
        print("it is not valid number");
    }
    else 
    {
        // 59
        int last = number % 10; //9
        int first = number ~/ 10; //5
        List<String> words = ['zero ','one ','two ','three ','four ','five ','six ','seven ','eight ','nine'];
        print(words[first] + words[last]);
    }
}