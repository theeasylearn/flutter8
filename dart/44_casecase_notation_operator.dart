class MyMath 
{
    var x,y;
    void setValue(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    add()
    {
        var result = x + y;
        print("addition " + result.toString());
    }
    sub()
    {
        var result = x - y;
        print("substraction " + result.toString());
    }
    mul()
    {
         var result = x * y;
        print("multiplication " + result.toString());
    }
    div()
    {
         var result = x / y;
        print("division " + result.toString());
    }
}
void main()
{
    MyMath m1 = new MyMath();
    m1..setValue(10,3)..add()..sub()..mul()..div();
}