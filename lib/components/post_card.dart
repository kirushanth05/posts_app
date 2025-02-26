import 'package:flutter/material.dart';
import 'package:posts_app/models/post.dart';
import 'package:posts_app/pages/post_screen.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

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
                    post.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${post.views} Views',
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
              post.content,
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
      MaterialPageRoute(
        builder: (context) => PostScreen(
          post: post,
        ),
      ),
    );
  }
}