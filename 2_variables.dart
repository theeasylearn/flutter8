void main()
{
    //create variables
    int age = 38;
    double location = 21.3245678;
    bool gender = true;
    String name = "the easylearn academy";

    print(age);
    print(location);

    print(gender);
    print(name);

    //display variable name inside double quote(string)
    print("name = $name");
    print("age = $age");
    print("location = $location");
    print("gender = $gender");

    //concatenate variables with string
    print("age = " + age.toString());
    print("location = " + location.toString());
    print("gender = " + gender.toString());
    print("name = " + name);

}