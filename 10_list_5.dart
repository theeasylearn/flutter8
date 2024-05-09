void main()
{
    var places = ['Vadodara','Bhavnagar','Rajkot','Junagadh','Ahmedabad','Bhavnagar'];
    print("position of ahmedabad " + places.indexOf('Ahmedabad').toString());
    print("position of jamnagar " + places.indexOf('Jamnagar').toString());
    print("position of Last  Bhavnagar " + places.lastIndexOf('Bhavnagar').toString());
    print("has this list has Bhavnagar ");
    print(places.contains('Bhavnagar'));
    print("has this list has surat ");
    print(places.contains('surat'));

    var numbers = [100,50,25,75,36];
    print(numbers);

    //sorting
    numbers.sort();
    print(numbers);

    numbers = numbers.reversed.toList();
    print(numbers);

    //list filter
    var filtered_numbers = numbers.where((item) => item>50).toList();
    print(filtered_numbers);

    
}