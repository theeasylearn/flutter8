import 'dart:io';

void main()
{
    print("Enter Amount");
    double amount = double.parse(stdin.readLineSync().toString());
    print("Enter Rate");
    double rate = double.parse(stdin.readLineSync().toString());
    print("Enter Year");
    int years = int.parse(stdin.readLineSync().toString());
    double interest;
    int count=1;
    while(count<=years) // < <= >= > == !=
    {
        interest = (amount * rate * 1) / 100;
        amount = amount + interest;
        count++;
    }
    print("amount receivable = $amount");
}