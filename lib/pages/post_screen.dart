import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/default_app_bar.dart';
import 'package:posts_app/models/post.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ('By ${post.author}').toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    '${post.createdAt.year}/ ${post.createdAt.month} / ${post.createdAt.day}'),
              ],
            ),
            const Gap(16),
            Text(
              post.content,
            ),
          ],
        ),
      ),
    );
  }
}