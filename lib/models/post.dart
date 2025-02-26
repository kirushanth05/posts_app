import 'dart:math';

final random = Random();

class Post {
  String id;
  String title;
  String author;
  String content;
  DateTime createdAt;
  int views;

  Post({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.createdAt,
  }) : views = random.nextInt(15000);
}