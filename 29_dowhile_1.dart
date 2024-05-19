import 'dart:io';
void main()
{
    print("Enter number");
    int number = int.parse(stdin.readLineSync().toString());
    int divisor = 2;
    int reminder = 0;
    if(number%2==0 && number!=2)
        print("it is not prime number");
    else 
    {   
        if(number<=3)
            print('it is prime number');
        else 
        {
            do 
            {
                reminder = number % divisor; //1
                if(reminder==0)
                {
                    print("it is not prime number");
                    break; //stop loop and run code after loop
                }
                divisor=divisor + 1;
            }while(divisor<=(number ~/2));
            if(divisor==(number ~/ 2)+1 )
                print("it is prime number");
        }
        
    }
   
}