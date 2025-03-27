import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.feed),
              title: Text('Feeds'),
              onTap: () {
                Navigator.pushNamed(context, '/feeds');
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Market'),
              onTap: () {
                Navigator.pushNamed(context, '/market');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/surwa_logo.png', // Make sure to add this image to your assets
              width: 350, // Adjust width as needed
              height: 250, // Adjust height as needed
            ),
          ],
        ),
      ),
    );
  }
}