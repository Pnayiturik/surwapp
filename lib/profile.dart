import 'package:flutter/material.dart';
import 'package:surwaapp/settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 3; // Set to Account index since this is the profile page

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
        // Already on profile screen
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'patrick',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to SettingsScreen when settings icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
              },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/patrickprofile.jpg'),
                  onBackgroundImageError: (exception, stackTrace) {
                    print('Error loading image: $exception');
                  },
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('Posts', '0'),
                      _buildStatColumn('Followers', '120'),
                      _buildStatColumn('Following', '100'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text('A certified crafter specialized in uduseke, ibyibo,'),
                Row(
                  children: [
                    Text('Read more'),
                    Icon(Icons.keyboard_arrow_down, size: 14),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Tabs for Posts, Likes, and Tags
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.favorite_border)),
              Tab(icon: Icon(Icons.bookmark_border)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Posts Tab
                Center(
                  child: Text(
                    "You don't have any posts yet..",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                // Likes Tab
                Center(
                  child: Text(
                    "No liked posts",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                // Tags Tab
                Center(
                  child: Text(
                    "No tagged posts",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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

  Widget _buildStatColumn(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}