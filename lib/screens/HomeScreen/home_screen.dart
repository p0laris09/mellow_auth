import 'package:flutter/material.dart';
import 'package:mellow_auth/screens/AnalyticsScreen/analytics_screen.dart';
import 'package:mellow_auth/screens/CollaborationScreen/collaboration_screen.dart';
import 'package:mellow_auth/screens/TaskManagement/task_management_screen.dart';
import 'package:mellow_auth/widgets/cards/task_card.dart';
import 'package:mellow_auth/widgets/navbar/my_app_bar.dart';
import 'package:mellow_auth/widgets/navbar/my_bottom_nav_bar.dart';
import 'package:mellow_auth/widgets/navbar/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected bottom navigation item

  // List of pages corresponding to the bottom navigation items
  final List<Widget> _pages = [
    const HomeScreenContent(), // Home page content
    const TaskManagementScreen(), // Task management page content
    const CollaborationScreen(), // Collaboration page content
    const AnalyticsScreen(), // Analytics page content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: _pages[
          _selectedIndex], // Display the page corresponding to the selected tab
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// widget for the home page content
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello Polaris!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "Have a nice day.",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.black87),
          ),
          SizedBox(height: 16),
          _buildTaskCards(),
          SizedBox(height: 32),
          _buildProgressSection(),
        ],
      ),
    );
  }

  Widget _buildTaskCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskCard(
              project: "Project 1",
              title: "Front-End Development",
              date: "30 September 2024"),
          SizedBox(width: 16),
          TaskCard(
            project: "Project 2",
            title: "Back-End Development",
            date: "20 October 2024",
            opacity: 0.5, // Less visible
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Progress",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16),
        _buildProgressTask("Design Changes", "2 Days ago"),
        SizedBox(height: 8),
        _buildProgressTask("API Integration", "3 Days ago"),
      ],
    );
  }

  Widget _buildProgressTask(String taskName, String taskDate) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.task, color: Colors.white),
          ),
          SizedBox(width: 16),
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
          Spacer(),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Handle options button
            },
          ),
        ],
      ),
    );
  }
}
