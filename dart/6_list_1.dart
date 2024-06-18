void main()
{
    int size = 5;
    String defaultValue = '';
    //fixed type fixed size list
    List<String> friends = List.filled(size,defaultValue,growable:false);
    friends[0] = "Ram";
    friends[1] = "Krishna";
    friends[2] = "Shiva";
    friends[3] = "Hanuman";
    friends[4] = "Ganesha";

    print(friends);
    // friends.add('Surya'); Cannot add to a fixed-length list
    
}