import 'package:flutter/material.dart';

AppBar defaultAppBar(BuildContext context, {String? title}) {
  return AppBar(
    elevation: 10,
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    shadowColor: Colors.black12,
    // leading: Icon(Icons.arrow_back),
    title: title != null
        ? Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        : null,
  );
}