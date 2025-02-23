import 'package:flutter/material.dart';
import 'package:posts_app/components/default_app_bar.dart';
import 'package:posts_app/components/post_card.dart';
import 'package:posts_app/pages/create_post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8F8),
      appBar: defaultAppBar(context, title: 'Posts'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostScreen(),
            ),
          );
        },
        child: Icon(
          Icons.history_edu,
          color: Colors.blue.shade800,
          size: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 23),
        child: Column(
          children: [
            PostCard(),
          ],
        ),
      ),
    );
  }
}