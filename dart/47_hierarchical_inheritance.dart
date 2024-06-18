import 'dart:io';
class MyMath
{
    int getSquare(int number)
    {
        return number * number;
    }
    double getPi()
    {
        return 3.1415;
    }
}
class Circle extends MyMath
{
    int radius=0;
    Circle(int radius)
    {
        this.radius = radius;
    }
    double getArea()
    {
        double temp = super.getPi() * super.getSquare(this.radius);
        return temp;
    }
}
class Cyliender extends MyMath
{
    int radius=0,height=0;
    Cyliender(int radius,int height)
    {
        this.radius = radius;
        this.height = height;
    }
    double getArea()
    {
        double temp = super.getPi() * super.getSquare(this.radius) * this.height;
        return temp;
    }
}
void main()
{
    print("Enter radius of circle");
    int radius = int.parse(stdin.readLineSync().toString());

    //create circle class object 
    Circle c1 = new Circle(radius); //constructor will be called implicitly
    double area = c1.getArea();
    print("circle area = $area");

    print("Enter radius of cyliender");
    radius = int.parse(stdin.readLineSync().toString());

    print("Enter height of cyliender");
    int height = int.parse(stdin.readLineSync().toString());

    Cyliender c2 = new Cyliender(radius,height); //constructor will be called implicitly

    area = c2.getArea();
    print("cyliender area = $area");

}