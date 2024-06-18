void main()
{
    print("working with list(array)");
    //create list/ARRAY
    //var listname = []
    var fruits = ['apple','banana','mango','pinapple','kiwi'];
    var vegitables = ['potato','lady-finger','tomato'];
    var grains = ['wheat','rise'];
    var nothing = null; //not a list 

    print(fruits);
    print(vegitables);
    print(grains);
    print(nothing);

    //how to merge list 
    var MyList1 = List.from(fruits)..addAll(vegitables)..addAll(grains);
    print(MyList1);

    var MyList2 = fruits + vegitables + grains;
    print(MyList2);

    var myList3 = [...fruits,...vegitables,...grains];
    print(myList3);

     var myList4 = [...?fruits,...?vegitables,...?grains,...?nothing];
    print(myList4);

    var myList5 = [fruits,vegitables,grains].expand((value) => value).toList();
     print(myList5);
}