import 'dart:io';
void main()
{
    //declare variables
    String? name;
    int age;
    double weight;

    print("Enter your name");
    name = stdin.readLineSync();

    print("Enter your age");
    age = int.parse(stdin.readLineSync().toString());

    print("Enter your weight");
    weight = double.parse(stdin.readLineSync().toString());

    print("name = $name age = $age weight = $weight");

}