/*
    write a program to print following pattern 
    *
    * * 
    * * *
    * * * *
    * * * * *
*/
import 'dart:io';
void main()
{
   for(int j=1;j<=5;j++) 
   {
        for(int i=1;i<=j;i++)
        {
            stdout.write("* ");
        }
        print("");
   }
    
}