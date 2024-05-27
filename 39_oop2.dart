//create class 
class Student 
{
    //instance variable
    String name='';
    bool gender=false;
    double weight=0.0;
    int age=0;
    //constructor
    Student(String n,double w,int a,[bool g=false])
    {
        print("constructor called...");
        name = n;
        weight = w;
        age = a;
        gender = g;
    }
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
    Student s1 = Student("Jay",65.11,21,true);
    s1.display();

    Student s2 = new Student("Priya",60.25,24);
    s2.display();
}