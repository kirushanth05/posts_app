import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/custom_button.dart';

import 'package:posts_app/components/default_app_bar.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

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
              decoration: InputDecoration(
                hintText: 'Enter the title of the post here...',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            inputLabel('Author'),
            TextField(
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
                // maxLines: 10,
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
            CustomButton(label: 'Create Post'),
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
}