import 'package:flutter/material.dart';
import 'package:posts_app/components/default_app_bar.dart';
import 'package:posts_app/components/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8F8),
      appBar: defaultAppBar(context, title: 'Posts'),
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