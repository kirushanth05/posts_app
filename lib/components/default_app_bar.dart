import 'package:flutter/material.dart';

AppBar defaultAppBar(
  BuildContext context, {
  String? title,
  bool showActions = false,
  Function()? onEdit,
  Function()? onDelete,
}) {
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
    actions: showActions
        ? [
            IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
            IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ]
        : null,
  );
}