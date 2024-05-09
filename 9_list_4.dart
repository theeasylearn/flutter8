void main()
{
    //create mixed type list
    var myThings = [100,'Orange',12.7,true,'Mango',3.14,false]; 
    print(myThings);

    print(myThings.length);
    print(myThings[0]); //100
    print(myThings[6]); //false
    print(myThings[5]); //3.14
    print(myThings[1]); //Orange

    //findout whether list is empty or not
    print(myThings.isEmpty); //false
    print(myThings.isNotEmpty); //true 

    //get 1st four element from list
    print(myThings.take(4).toList());

    //get 2,3,4 elements from list 
    print(myThings.getRange(1,4).toList());

    //remove 1 and 2 item from list
    myThings.removeRange(1,3);
    print(myThings);

    //remove oth item
    myThings.removeAt(0);
    print(myThings);

    myThings.clear(); //remove all items from list 
    print(myThings);
}