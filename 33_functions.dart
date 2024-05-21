import 'dart:io';
//with argument with regurn value function
double toCeilcius(double farenheit)
{
    double ceilcius = (farenheit - 32) * (5/9);
    return ceilcius;
}
void main()
{
    print("Enter temprature in farenheit");
    double farenheit = double.parse(stdin.readLineSync().toString());
    //call function 
    double ceilcius = toCeilcius(farenheit);
    print("ceilcius = $ceilcius");
}