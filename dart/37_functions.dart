import "dart:io";
//count city name ending with pur
void main()
{
    var cities = ['Jaipur','Kanpur','Nagpur','Udaipur','Jodhpur','Mumbai','Delhi','Bangalore','Chennai','Kolkata','Hyderabad','Pune','Ahmedabad','Surat','Lucknow','Patna','Bhopal','Ranchi','Guwahati','Vijayawada'];
    int count=0;
    cities.forEach((item){
        if(item.endsWith('pur')==true)
            count++;
    });
    print("count = $count");
}