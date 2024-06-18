enum signal {red,green,blue}
void main()
{
    signal action = signal.red;
    print(action);

    action = signal.green;
    print(action);

    action = signal.blue;
    print(action.index);

    // action = 4; //error
    // print(action);
}