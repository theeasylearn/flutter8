class Book 
{
    String? name,_author;
    int _price=0;
    void display()
    {
        print("Name = " + this.name.toString());
        print("Author = " + this._author.toString());
        print("Price = " + this._price.toString());
    }
}
void main()
{
    //create book class object
    Book b1 = new Book();
    b1.name = "Atomic habit";
    b1._author = "James clear";
    b1._price = 500;

    b1.display();
}