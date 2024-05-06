void main()
{
    int initialsize = 2;
    double defaultvalue = 0.0;
    //create double type dynamic list
    List<double> locations = new List<double>.filled(initialsize,defaultvalue,growable:true);

    //store bhavnagar's latitude  at 1st position
    locations[0] = 22.14;
    locations[1] = 72.16;

    //add rajkot location
    locations.add(25.15);
    locations.add(71.89);

    print(locations);

    //create empty list (always mixed type & dynamic)
    var things = [];
    things.add('flutter 8');
    things.add(100);
    things.add(3.14);
    things.add(true);

    print(things);

    //create another list with some values
    var person = ["Ankit Patel",38,81.25,true];
    print(person);
}