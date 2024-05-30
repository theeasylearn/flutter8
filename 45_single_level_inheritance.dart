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
void main()
{
    KB k1 = new KB(8192);
    double result = k1.getKB();
    print("kb = $result");

    MB m1 = new MB(819200000);
    result = m1.getMB();
    print("mb = $result");
    result = m1.getKB();
    print("kb = $result");
    
}