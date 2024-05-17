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
        String words = "";
        switch(first)
        {
            case 0:
            words = "zero ";
            break;

            case 1:
            words = "one ";
            break;

            case 2:
            words = "two ";
            break;

            case 3:
            words = "three ";
            break;

            case 4:
            words = "four ";
            break;

            case 5:
            words = "five ";
            break;

            case 6:
            words = "six ";
            break;

            case 7:
            words = "seven ";
            break;

            case 8:
            words = "eight ";
            break;

            case 9:
            words = "nine ";
            break;

        }
        switch(last)
        {
            case 0:
            words += "zero ";
            break;

            case 1:
            words += "one ";
            break;

            case 2:
            words += "two ";
            break;

            case 3:
            words += "three ";
            break;

            case 4:
            words += "four ";
            break;

            case 5:
            words += "five ";
            break;

            case 6:
            words += "six ";
            break;

            case 7:
            words += "seven ";
            break;

            case 8:
            words += "eight ";
            break;

            case 9:
            words += "nine ";
            break;

        }
        print(words);
    }
}