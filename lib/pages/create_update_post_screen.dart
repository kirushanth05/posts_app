import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/custom_button.dart';
import 'package:http/http.dart' as http;

import 'package:posts_app/components/default_app_bar.dart';
import 'package:posts_app/models/post.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, this.onCreate, this.post, this.onUpdate});

  final void Function()? onCreate;
  final void Function(Post post)? onUpdate;
  final Post? post;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool isAdding = false;
  bool isUpdating = false;

  @override
  void initState() {
    if (widget.post != null) {
      _titleController.text = widget.post!.title;
      _authorNameController.text = widget.post!.author;
      _contentController.text = widget.post!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8F8),
      appBar: defaultAppBar(context,
          title: '${widget.post != null ? 'Update' : 'Create'} Post'),
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
              label:
                  '${widget.post != null ? (isUpdating ? 'Updating' : 'Update') : (isAdding ? 'Creating' : 'Create')} Post',
              onTap: widget.post != null ? _updatePost : _addPost,
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

  bool isValidInputs() {
    final String title = _titleController.text.trim();
    final String author = _authorNameController.text.trim();
    final String content = _contentController.text.trim();

    if (title.isEmpty || author.isEmpty || content.isEmpty) return false;

    if (content.length < 50) return false;

    return true;
  }

  void _addPost() async {
    if (isAdding) return;

    if (!isValidInputs()) {
      _showDialog('Invalid inputs!',
          'Check your inputs! All fields are required and the content should be more than 50 characters long');
      return;
    }

    setState(() {
      isAdding = true;
    });
    Uri url = Uri.https(
      dotenv.env['FIREBASE_REALTIME_DB_URL']!,
      'posts.json',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': _titleController.text,
        'author': _authorNameController.text,
        'content': _contentController.text,
        'createdAt': DateTime.now().toString(),
      }),
    );

    setState(() {
      isAdding = false;
    });

    if (response.statusCode >= 400) {
      _showDialog('Error!', 'Failed to add post. Please try again later');
      return;
    }

    _titleController.clear();
    _authorNameController.clear();
    _contentController.clear();

    _showDialog('Success!', 'Post added successfully');
    if (widget.onCreate != null) widget.onCreate!();
  }

  void _updatePost() async {
    if (isUpdating) return;

    if (!isValidInputs()) {
      _showDialog('Invalid inputs!',
          'Check your inputs! All fields are required and the content should be more than 50 characters long');
      return;
    }

    setState(() {
      isUpdating = true;
    });
    Uri url = Uri.https(
      dotenv.env['FIREBASE_REALTIME_DB_URL']!,
      'posts/${widget.post!.id}.json',
    );

    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': widget.post!.id,
        'title': _titleController.text,
        'author': _authorNameController.text,
        'content': _contentController.text,
        'updatedAt': DateTime.now().toString(),
      }),
    );

    setState(() {
      isUpdating = false;
    });

    if (response.statusCode >= 400) {
      _showDialog('Error!', 'Failed to update post. Please try again later');
      return;
    }

    _showDialog('Success!', 'Post updated successfully');

    if (widget.onUpdate != null) {
      widget.onUpdate!(Post(
          id: widget.post!.id,
          title: _titleController.text,
          author: _authorNameController.text,
          content: _contentController.text,
          createdAt: widget.post!.createdAt));
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(
          content,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('close'),
          )
        ],
      ),
    );
  }
}