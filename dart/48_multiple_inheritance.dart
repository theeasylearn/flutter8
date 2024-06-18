import 'dart:io';
//normal class
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
//interface
abstract class Shape 
{
    void display();  //must Override this method
    double getArea(); //must Override this method
}
class Cyliender extends MyMath implements Shape
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
    void display()
    {
        print("height = $this.height radius = $this.radius");
    }
}
void main()
{
    Cyliender c1 = new Cyliender(100,25);
    c1.display();
    print(c1.getArea());
}