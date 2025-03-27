import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<MessageUser> allUsers = [
    MessageUser(
      name: 'nagasaro',
      lastMessage: 'Can you tell me more info about this product?',
      time: '12:45',
      isUnread: true,
    ),
    MessageUser(
      name: 'kenny',
      lastMessage: 'I’m interested in your listing.',
      time: '11:20',
      isUnread: false,
    ),
    MessageUser(
      name: 'david',
      lastMessage: 'Let’s negotiate the price.',
      time: '10:15',
      isUnread: true,
    ),
    MessageUser(
      name: 'Stella',
      lastMessage: 'Thanks for the details.',
      time: '09:50',
      isUnread: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 5),
            Image.asset(
              'assets/images/surwa_logo.png',
              width: 150,
              height: 80,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          tabs: [
            Tab(text: 'All'),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Unread'),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${allUsers.where((user) => user.isUnread).length}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildMessageList(allUsers), // All messages
          buildMessageList(
            allUsers.where((user) => user.isUnread).toList(),
          ), // Unread messages
        ],
      ),
    );
  }

  Widget buildMessageList(List<MessageUser> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return MessageUserTile(
          user: users[index],
          onTap: () {
            setState(() {
              users[index].isUnread = false; // Mark as read when opened
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(user: users[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class MessageUser {
  final String name;
  final String lastMessage;
  final String time;
  bool isUnread;

  MessageUser({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.isUnread = false,
  });
}

class MessageUserTile extends StatelessWidget {
  final MessageUser user;
  final VoidCallback onTap;

  const MessageUserTile({Key? key, required this.user, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFFE6E6FA),
        child: Icon(Icons.person_outline, color: Colors.deepPurple),
      ),
      title: Text(
        user.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: user.isUnread ? Colors.black : Colors.grey,
        ),
      ),
      subtitle: Text(
        user.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: user.isUnread ? Colors.black : Colors.grey,
          fontWeight: user.isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            user.time,
            style: TextStyle(
              color: user.isUnread ? Colors.green : Colors.grey,
              fontWeight: user.isUnread ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (user.isUnread)
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
              child: Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
