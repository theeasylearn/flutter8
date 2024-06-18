import 'dart:io';
void main()
{
    print("Enter height of shape");
    int height = int.parse(stdin.readLineSync().toString());

    print("Enter width of shape");
    int width = int.parse(stdin.readLineSync().toString());

    //check whether this shape is portrait or not 
    if(height>width)
    {
        print("it is potrait shape");
    }
    else if(height<width)
    {
        print("it is landscape shape");
    }
    else 
    {
        print("it is square shape");
    }
       
}