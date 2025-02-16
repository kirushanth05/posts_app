import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posts_app/components/default_app_bar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});
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
              'The Art of Healthy Living',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ('By Jane Marsh').toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('6.12.2020'),
              ],
            ),
            const Gap(16),
            Text(
              'Dolore esse eu deserunt aliqua aliquip labore sunt. Reprehenderit ut dolor exercitation exercitation. Est dolore ut Lorem non ipsum ex quis laborum elit non laboris dolor. Consequat deserunt officia consectetur deserunt mollit laborum et nostrud cupidatat mollit aliqua enim consequat nisi enim. Sit ad amet incididunt cillum non incididunt adipisicing veniam duis consequat laboris laboris cillum qui veniam. Dolore minim voluptate velit laboris velit elit quis commodo irure cillum. Sit minim nulla dolor fugiat in quis. ',
            ),
          ],
        ),
      ),
    );
  }
}