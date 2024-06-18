//write a program to count total, odd and event values in integer list using forin loop
void main()
{
    //create fixed type dynamic list 
    List<int> numbers = [25,50,12,37,89,66,125,100,9,45,90,80];
    int odd=0,even=0;
    for(var num in numbers)
    {
        // print(num);
        if(num%2==0)
            even= even + 1; //1
        else 
            odd = odd + 1; //1
    }
    print("odd values = $odd\n even values = $even");
    int total = odd + even;
    print("total = $total");
}