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
      child: Row(
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
                '14k Followers',
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
    );
  }
  void showDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostScreen()),
    );
  }
}