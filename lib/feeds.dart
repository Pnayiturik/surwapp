import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Image.asset('assets/images/surwa_logo.png', height: 50), // Enlarged logo size
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Color(0xFFFFD700),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Following'),
              Tab(text: 'Discover'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFollowingTab(),
            _buildDiscoverTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowingTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPostItem(),
          Divider(),
          // Add more posts here
        ],
      ),
    );
  }

  Widget _buildDiscoverTab() {
    return Center(
      child: Text(
        'Discover Content Here',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildPostItem() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              SizedBox(width: 8),
              Text(
                'Khalid Sipiriyani',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Lorem ipsum, discover more on fashion in Kigali Car free zone',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
