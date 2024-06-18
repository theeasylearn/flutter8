import "dart:io";
int add(int num1,int num2) => num1 + num2;
int sub(int num1,int num2) => num1 - num2;
int mul(int num1,int num2) => num1 * num2;
double div(int num1,int num2) => num1 / num2;
void main()
{
    print("Enter first number");
    int num1 = int.parse(stdin.readLineSync().toString());

    print("Enter second number");
    int num2 = int.parse(stdin.readLineSync().toString());
    
    //calling arrow function
    int result = add(num1,num2);
    print("addition = $result");

    result = sub(num1,num2);
    print("substraction = $result");

    result = mul(num1,num2);
    print("multiplication = $result");

    double result2 = div(num1,num2);
    print("division = $result2");


}