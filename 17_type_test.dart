void main()
{
    dynamic value = '1000';
    bool result = value is int;
    print("$value is integer = $result");

    value = 122;
    result = value is int;
    print("$value is integer = $result");

     value = false;
    result = value is! double;
    print("$value is not double = $result");

    value = 100;
    result = value is! String;
    print("$value is not string = $result");
}