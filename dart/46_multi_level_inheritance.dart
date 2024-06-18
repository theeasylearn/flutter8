import 'dart:io';
class KB 
{
    int bytes=0;
    KB(int bytes)
    {
        this.bytes = bytes;
        print("KB class constructor is called.");
    }
    double getKB()
    {
        double temp = this.bytes/1024;
        return temp;
    }
}
class MB extends KB
{
    MB(int bytes) : super(bytes)
    {
        print("MB class constructor is called.");
    }
    double getMB()
    {
         double temp = super.getKB() /1024;
         return temp;
    }
}
class GB extends MB
{
    GB(int bytes) : super(bytes)
    {
        print("GB class constructor is called.");
    }
    double getGB()
    {
         double temp = super.getMB() /1024;
         return temp;
    }
}
void main()
{
    int bytes;
    print("Enter bytes");
    bytes = int.parse(stdin.readLineSync().toString());
    
    //create object
    GB g1 = new GB(bytes);
    double result = g1.getGB();
    double result2 = g1.getMB();
    double result3 = g1.getKB();

    print("GB = $result mb = $result2 kb = $result3");
}   