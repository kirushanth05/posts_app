import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/custom_button.dart';
import 'package:http/http.dart' as http;

import 'package:posts_app/components/default_app_bar.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorNameController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool isAdding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8F8),
      appBar: defaultAppBar(context, title: 'Create Post'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputLabel('Title'),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title of the post here...',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            inputLabel('Author'),
            TextField(
              controller: _authorNameController,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'The name of the author....',
              ),
            ),
            const Gap(16),
            inputLabel('Content'),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write the content here...',
                ),
              ),
            ),
            const Gap(16),
            CustomButton(
              label: 'Create Post',
              onTap: _addPost,
              isLoading: isAdding,
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }

  Text inputLabel(String label) => Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      );

  void _addPost() async {
    setState(() {
      isAdding = true;
    });
    Uri url = Uri.https(
      'posts-app-4ab91-default-rtdb.asia-southeast1.firebasedatabase.app',
      'posts.json',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': _titleController.text,
        'author': _authorNameController.text,
        'content': _contentController.text
      }),
    );
    print('the response ${response.body}');
  }
}