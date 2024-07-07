import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final IconData icon;
  const Message({
    super.key,
    required this.title,
    required this.content,
    this.color = Colors.red,
    this.icon = Icons.error,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text(title, style: TextStyle(color: color)),
      content: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              content,
              softWrap: true,
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Accept'),
        ),
      ],
    );
  }
}
