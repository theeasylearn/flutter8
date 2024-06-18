import "dart:collection";
void main()
{
    //create 
    Set<String> colors = {'red','green','blue','red'};
    print(colors);

    //add one value
    colors.add('green');
    colors.add('pink');

    print(colors);
    var colors2 = ['white','black','pink'];
    var colors3 = ['orange','cyan','pink'];

    colors.addAll(colors2);
    colors.addAll(colors3);
     print(colors);
    
    var fruits = <String> {'apple','cherry','mango','apple'};
     print(fruits);
    

}