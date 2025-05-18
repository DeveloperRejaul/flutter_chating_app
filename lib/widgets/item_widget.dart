import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String name;
  final String email;

  const ItemWidget({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          email,
        ),
        trailing: const Icon(
          Icons.chat_bubble_outline,
        ),
        onTap: () {
          print("hello world");
          Navigator.pushNamed(context, '/chat');
        },
      ),
    );
  }
}
