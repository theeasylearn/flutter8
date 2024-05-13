void main()
{
    int a = 0, b = 0;
    var result;
    result ??= a + b;

    print(result); //35

    result ??= a - 25;
    print(result); //35


}