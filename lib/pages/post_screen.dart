import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/default_app_bar.dart';
import 'package:posts_app/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:posts_app/pages/create_update_post_screen.dart';
// import 'dart:convert';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.post, this.onDelete});

  final Post post;
  final Function()? onDelete;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        context,
        showActions: true,
        onEdit: () {
          _editPost(context);
        },
        onDelete: () {
          _deletePost(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ('By ${widget.post.author}').toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    '${widget.post.createdAt.year}/ ${widget.post.createdAt.month} / ${widget.post.createdAt.day}'),
              ],
            ),
            const Gap(16),
            Text(
              widget.post.content,
            ),
          ],
        ),
      ),
    );
  }

  _deletePost(BuildContext context) async {
    Uri url = Uri.https(dotenv.env['FIREBASE_REALTIME_DB_URL']!,
        'posts/${widget.post.id}.json');
    final response = await http.delete(url);

    if (response.statusCode == 200 && widget.onDelete != null)
      widget.onDelete!();
    Navigator.pop(context);
  }

  void _editPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePostScreen(
          post: widget.post,
          onUpdate: (updatedPost) {
            setState(() {
              widget.post.title = updatedPost.title;
              widget.post.author = updatedPost.author;
              widget.post.content = updatedPost.content;
            });
            if (widget.onDelete != null) {
            widget.onDelete!();
            }
          },
        ),
      ),
    );
  }
}