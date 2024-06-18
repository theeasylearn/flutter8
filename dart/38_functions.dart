import "dart:io";
//count city name ending with pur
void main()
{
    List<Map<String, dynamic>> products = [
    {"name": "Laptop", "price": 999.99, "details": "15 inch, 8GB RAM, 256GB SSD"},
    {"name": "Smartphone", "price": 699.99, "details": "6 inch, 128GB storage, Dual SIM"},
    {"name": "Headphones", "price": 199.99, "details": "Noise Cancelling, Wireless"},
    {"name": "Smartwatch", "price": 299.99, "details": "Heart Rate Monitor, GPS"},
    {"name": "Tablet", "price": 499.99, "details": "10 inch, 64GB storage, WiFi"},
    {"name": "Monitor", "price": 249.99, "details": "24 inch, 1080p, HDMI"},
    {"name": "Keyboard", "price": 49.99, "details": "Mechanical, RGB Backlit"},
    {"name": "Mouse", "price": 29.99, "details": "Wireless, Ergonomic"},
    {"name": "Printer", "price": 149.99, "details": "All-in-One, Wireless"},
    {"name": "Camera", "price": 599.99, "details": "DSLR, 24MP, 1080p Video"},
    {"name": "Speaker", "price": 89.99, "details": "Bluetooth, Portable"},
    {"name": "Router", "price": 129.99, "details": "Dual Band, 1200Mbps"},
    {"name": "External Hard Drive", "price": 79.99, "details": "1TB, USB 3.0"},
    {"name": "Smart Home Hub", "price": 99.99, "details": "Voice Control, WiFi"},
    {"name": "Electric Toothbrush", "price": 59.99, "details": "Rechargeable, Multiple Modes"},
    {"name": "Coffee Maker", "price": 89.99, "details": "Programmable, 12 Cup"},
    {"name": "Blender", "price": 49.99, "details": "600W, 5 Speeds"},
    {"name": "Vacuum Cleaner", "price": 129.99, "details": "Bagless, HEPA Filter"},
    {"name": "Air Purifier", "price": 199.99, "details": "HEPA Filter, Smart Control"},
    {"name": "Fitness Tracker", "price": 69.99, "details": "Heart Rate Monitor, Sleep Tracking"}
  ];
    print("Enter lowest price of product");
    int lowest = int.parse(stdin.readLineSync().toString());

    print("Enter highest of product");
    int highest = int.parse(stdin.readLineSync().toString());
    List<Map<String, dynamic>> filteredProducts =  [];
    products.forEach((current){
        if(current['price']>=lowest && current['price']<=highest)
            filteredProducts.add(current);
    });

    filteredProducts.forEach((current){
        print(current['name'] + " " + current["price"].toString());
    });
}