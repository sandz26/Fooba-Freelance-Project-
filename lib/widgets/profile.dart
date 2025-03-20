import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withAlpha(128),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            _buildActivitySummary(),
            _buildUserDetails(),
            _buildPantrySummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: Colors.grey.shade100,
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              'JD',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Placeholder for edit profile navigation
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySummary() {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity Summary',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            _buildActivityRow(
                icon: Icons.kitchen,
                label: 'Pantries Created',
                value: '3'),
            _buildActivityRow(
                icon: Icons.food_bank,
                label: 'Total Items',
                value: '24'),
            _buildActivityRow(
                icon: Icons.calendar_today,
                label: 'Member Since',
                value: '2023-01-15'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityRow(
      {required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 24),
          SizedBox(width: 10),
          Text(label, style: TextStyle(color: Colors.black54)),
          Spacer(),
          Text(value,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildUserDetails() {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            _buildDetailRow('Phone', '+1 (555) 123-4567'),
            _buildDetailRow('Nationality', 'United States'),
            _buildDetailRow('Address', '123 Main St, Anytown, USA'),
            _buildDetailRow('Verification Status', 'Verified'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.black54)),
          Spacer(),
          Text(value,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPantrySummary() {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pantry Overview',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            _buildPantryRow('Kitchen Pantry', '15 items'),
            _buildPantryRow('Refrigerator', '9 items'),
          ],
        ),
      ),
    );
  }

  Widget _buildPantryRow(String name, String itemCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.kitchen, color: Colors.black54),
          SizedBox(width: 10),
          Text(name, style: TextStyle(color: Colors.black)),
          Spacer(),
          Text(itemCount,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}