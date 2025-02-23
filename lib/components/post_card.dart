import 'package:flutter/material.dart';
import 'package:posts_app/pages/post_screen.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.only(top: 14, bottom: 14, left: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffEBEBEB), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              // title and description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Technology',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '14k Views',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),

              // show more button
              IconButton(
                onPressed: () {
                  showDetails(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_right_rounded,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              'Dolore esse eu deserunt aliqua aliquip labore sunt. Reprehenderit ut dolor exercitation exercitation. Est dolore ut Lorem non ipsum ex quis laborum elit non laboris dolor. Consequat deserunt officia consectetur deserunt mollit laborum et nostrud cupidatat mollit aliqua enim consequat nisi enim. Sit ad amet incididunt cillum non incididunt adipisicing veniam duis consequat laboris laboris cillum qui veniam. Dolore minim voluptate velit laboris velit elit quis commodo irure cillum. Sit minim nulla dolor fugiat in quis. ',
              style: TextStyle(color: Colors.grey.shade600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void showDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostScreen()),
    );
  }
}