import 'package:flutter/material.dart';
import 'package:mellow_auth/widgets/task_widget.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TaskWidget(taskName: "Design Changes", taskDate: "2 Days ago"),
        SizedBox(height: 8),
        TaskWidget(taskName: "API Integration", taskDate: "3 Days ago"),
        SizedBox(height: 8),
        TaskWidget(taskName: "API Integration", taskDate: "3 Days ago"),
      ],
    );
  }
}
