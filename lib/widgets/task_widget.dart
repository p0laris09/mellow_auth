import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String taskName;
  final String taskDate;

  const TaskWidget({
    super.key,
    required this.taskName,
    required this.taskDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Icon with a white background and grey border
          Container(
            padding: const EdgeInsets.all(8), // Padding around the icon
            decoration: BoxDecoration(
              color: Colors.grey[800], // Background color for the icon
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: const Icon(Icons.task, color: Colors.white), // Icon color
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                taskDate,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {
              // Handle options button
            },
          ),
        ],
      ),
    );
  }
}
