import 'dart:collection';
void main()
{
    //2nd method to create HashMap
    Map <String,double> location = {'latitude':72.15,'longitude':21.76,'accuracy':50.00};
    print(location);

    //print latitude
    print(location['latitude']);

    //print longitude
    print(location['longitude']);

    //print accuracy
    print(location['accuracy']);

    //can we add new key value pair, yes
    location['altitude']= 500.25;
    location['latitude']= 71.15;
    print(location);

    //create HashMap using 3rd technique (Mixed type) Inffered typing
    Map person = {'name':'Ankit','age':39,'weight':78.25};

    print(person);

    print(person['name']);
    print(person['age']);
    print(person['weight']);

    //create HashMap using 4th technique (Mixed type) Inffered typing
    var subject = {'name':'flutter','duration':150};
    print(subject);

    //creating empty map 
    var data = {};
    data['email'] = 'ankit3385@gmail.com';
    data['password'] = '123123';

    print(data);

    //read only map 
    var country = Map.unmodifiable({'name':'india','capital':'delhi','code':91});
    print(country); 

    // country['name'] = 'Bharat'; //it is error as map is ready only
}