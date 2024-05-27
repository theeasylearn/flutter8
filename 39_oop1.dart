//create class 
class Student 
{
    //instance variable
    String name='';
    bool gender=false;
    double weight=0.0;
    int age=0;
    //method
    void display()
    {
        print("Name = " + name);
        print("weight = $weight");
        print("age =  $age");
        if(gender == false)
            print("Female");
        else 
            print("Male");
    }
}
void main()
{
    //create object
    //classname object-name = new classname();
    Student s1 = Student();
    s1.name = "Aryan";
    s1.age = 19;
    s1.gender = true;
    s1.weight = 50.99;
    s1.display();

    Student s2 = new Student();
    s2.name = "Priya";
    s2.gender = false;
    s2.weight = 60.25;
    s2.age = 24;

    s2.display();
}