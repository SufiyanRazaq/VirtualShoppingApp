// notifications_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Order Shipped',
      'description': 'Your order #123456 has been shipped and is on the way!',
      'time': '2h ago',
    },
    {
      'title': 'Deal Alert!',
      'description': '20% off on electronics for the next 24 hours!',
      'time': '5h ago',
    },
    {
      'title': 'New Arrival',
      'description': 'New collection from Fashion Hub is now available!',
      'time': '1d ago',
    },
    {
      'title': 'Flash Sale',
      'description': 'Exclusive flash sale on select grocery items.',
      'time': '3d ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFF141E30),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return buildNotificationItem(notification);
        },
      ),
    );
  }

  Widget buildNotificationItem(Map<String, String> notification) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              notification['description']!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                notification['time']!,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
