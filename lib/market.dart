import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int _selectedIndex = 1; // Set to Market index

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the selected index using named routes
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/feeds');
        break;
      case 1:
        Navigator.pushNamed(context, '/market');
        break;
      case 2:
        Navigator.pushNamed(context, '/messages');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  // List of category items
  final List<Map<String, String>> _categories = [
    {'icon': 'clothing', 'label': 'Clothing'},
    {'icon': 'art', 'label': 'Art'},
    {'icon': 'jewelry', 'label': 'Jewelry'},
    {'icon': 'crafts', 'label': 'Crafts'},
    {'icon': 'shop', 'label': 'Shop'},
  ];

  // List of popular items
  final List<Map<String, dynamic>> _popularItems = [
    {
      'image': 'images/basket.jpg',
      'name': 'Handmade basket',
      'price': '5,000 Frw',
    },
    {
      'image': 'images/kitenge.jpg',
      'name': 'Igitenge bag',
      'price': '10,000 Frw',
    },
    {
      'image': 'images/basket.jpg',
      'name': 'Handmade basket',
      'price': '5,000 Frw',
    },
    {
      'image': 'images/kitenge.jpg',
      'name': 'Igitenge bag',
      'price': '10,000 Frw',
    },
    {
      'image': 'images/basket.jpg',
      'name': 'Handmade basket',
      'price': '5,000 Frw',
    },
    {
      'image': 'images/kitenge.jpg',
      'name': 'Igitenge bag',
      'price': '10,000 Frw',
    },
    {
      'image': 'images/basket.jpg',
      'name': 'Handmade basket',
      'price': '5,000 Frw',
    },
    {
      'image': 'images/kitenge.jpg',
      'name': 'Igitenge bag',
      'price': '10,000 Frw',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF59D), // Light yellow background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      hintText: 'Discover art, culture, and fashion in Rwanda',
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Art and Design Banner
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Art and Design',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to Art and Design category
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.green[600],
                                ),
                                child: Text('Shop Now'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/patrickprofile.jpg', // Replace with your image asset
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        _categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.green[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    _getIconForCategory(category['label']!),
                                    color: Colors.green[800],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  category['label']!,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 16),

                // Popular Items and Hot Deals Tabs
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Popular items',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Hot deals',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Popular Items Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: _popularItems.length,
                  itemBuilder: (context, index) {
                    final item = _popularItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                'assets/${item['image']}', // Replace with your image asset
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['price'],
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.shopping_cart,
                                        size: 16,
                                        color: Colors.green[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onBottomNavTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Market',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  // Helper method to get icons for categories
  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Clothing':
        return Icons.shopping_bag;
      case 'Art':
        return Icons.palette;
      case 'Jewelry':
        return Icons.diamond;
      case 'Crafts':
        return Icons.handyman;
      case 'Shop':
        return Icons.storefront;
      default:
        return Icons.category;
    }
  }
}
