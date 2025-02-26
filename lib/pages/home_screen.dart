import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/default_app_bar.dart';
import 'package:posts_app/components/post_card.dart';
import 'package:posts_app/models/post.dart';
import 'package:posts_app/pages/create_post_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    _fetchAllPosts();
    super.initState();
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (final post in posts) PostCard(post: post),
              const Gap(16),
              Text('the posts length is ${posts.length}')
            ],
          ),
        ),
      ),
    );
  }

  void _fetchAllPosts() async {
    Uri url = Uri.https(dotenv.env['FIREBASE_REALTIME_DB_URL']!, 'posts.json');
    final response = await http.get(url);
    final Map<String, dynamic> decodedResponse = json.decode(response.body);

    for (final data in decodedResponse.entries) {
      final postObj = Post(
        id: data.key,
        title: data.value['title'],
        author: data.value['author'],
        content: data.value['content'],
        createdAt: DateTime.parse(
            data.value['createdAt'] ?? DateTime.now().toString()),
      );

      setState(() {
        posts.add(postObj);
      });
    }
  }
}