import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String title;
  const UserProfilePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title Page'),
      ),
    );
  }
}
