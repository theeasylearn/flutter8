import "dart:collection";
void main()
{
    Map <String,double> location = {'latitude':72.15,'longitude':21.76,'accuracy':50.00};

    //find how many values this map has 
    print(location.length);

    //findout whether location has values or not 
    print(location.isEmpty);
    print(location.isNotEmpty);

    //find whether location has altitude or not
    print(location.containsKey('altitude'));
    print(location.containsKey('latitude'));

    //findout whther location has 50.00 as value or not
    print(location.containsValue(50.00));
    print(location.containsValue(150.00));

    //remove accuracy key from location
    location.remove('accuracy');
    print(location);

    //get all keys
    print(location.keys);

    //get all values 
    print(location.values);

    //can we cobine list and map
    //list of map
    var flutter8 = [
            {'name':'vivek','surname':'vegad','age':18},
            {'name':'kenil','surname':'patel','age':19},
            {'name':'jenish ','surname':'makwana','age':20},
            {'name':'pinak','surname':'bhayani','age':19},
        ]; 
    print(flutter8);
    print(flutter8[0]['name'].toString() + " " +  flutter8[0]['surname'].toString()); //display first student name and surname

    print(flutter8[1]['name']);
}