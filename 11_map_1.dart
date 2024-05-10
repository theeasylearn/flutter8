import 'dart:collection';
void main()
{
    //create map
    HashMap map1 = new HashMap<String,dynamic>();
    LinkedHashMap map2 = new LinkedHashMap<String,dynamic>();
    SplayTreeMap map3 = new SplayTreeMap<String,dynamic>();

    map1['subject'] = 'flutter';
    map1['duration'] = 150;
    map1['fees'] = 15000.99;
    map1['isCertified'] = true;

    print(map1);
    print(map1['subject']);
    print(map1['duration']);
    print(map1['fees']);
    print(map1['isCertified']);

    map2['subject'] = 'flutter';
    map2['duration'] = 150;
    map2['fees'] = 15000.99;
    map2['isCertified'] = true;

    print(map2);
    print(map2['subject']);
    print(map2['duration']);
    print(map2['fees']);
    print(map2['isCertified']);

    map3['subject'] = 'flutter';
    map3['duration'] = 150;
    map3['fees'] = 15000.99;
    map3['isCertified'] = true;

    print(map3);
    print(map3['subject']);
    print(map3['duration']);
    print(map3['fees']);
    print(map3['isCertified']);
}