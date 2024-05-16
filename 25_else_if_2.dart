import 'dart:io';
/* write a program to calculate income tax, net income, gross income from given monthly income 
as per below rule 
Annual Taxable Income	        New Tax Regime	      
Up to Rs.3 lakh	                Exempt	              
Over Rs.3 lakh to Rs. 5 lakh	5%	                   
Over Rs.5 lakh to Rs.9 lakh	    10%                  	
Over Rs.9 lakh              	15%	                   

*/
void main()
{
    int monthly_income,gross_income;
    double income_tax,net_income;

    print("Enter your monthly income");
    monthly_income = int.parse(stdin.readLineSync().toString());

    gross_income = monthly_income * 12; //yearly income (gross income)
    if(gross_income<300000)
    {
        income_tax = 0;
    }
    else if(gross_income<500000)
    {
        income_tax = (gross_income * 5) / 100;
    }
    else if(gross_income<900000)
    {
        income_tax = (gross_income * 10) / 100;
    }
    else 
    {
        income_tax = (gross_income * 15) / 100;
    }
    net_income = gross_income - income_tax;
    print("\n gross income = $gross_income \n income tax = $income_tax \n net income = $net_income");
    
}