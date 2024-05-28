class SimpleInterestCalculator
{
    //instance variable
    double amount=0.0,rate=0.0,year=0.0;
    SimpleInterestCalculator(double amount,double rate, double year)
    {
        print("constructor called....");
        this.amount = amount;
        this.rate = rate;
        this.year = year;
    }
    double getInterest()
    {
        double interest = (this.amount * this.year * this.rate) / 100;
        return interest;
    }
    //create named constructor
    SimpleInterestCalculator.namedConst(double amount)
    {
        print("Named constructor called...");
        this.amount = amount;
        this.rate = 12;
        this.year = 1;
    }
}
void main()
{
    //create object
    SimpleInterestCalculator s1 = new SimpleInterestCalculator(10000,15,2);
    double interest = s1.getInterest();

    print("Simple interest = $interest");

    //crete 2nd object using named constructor 
    SimpleInterestCalculator s2 = new SimpleInterestCalculator.namedConst(100000);
    interest = s2.getInterest();

    print("Simple interest = $interest");

}