// user_profile_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final String userName = "Sufiyan";
  final String userEmail = "user@example.com";

  List<String> addresses = [
    "123 Main St, Springfield",
    "456 Oak St, Shelbyville"
  ];
  List<String> paymentMethods = ["Visa **** 1234", "PayPal user@example.com"];
  List<Map<String, dynamic>> orderHistory = [
    {"orderID": "12345", "date": "2023-11-01", "status": "Delivered"},
    {"orderID": "67890", "date": "2023-10-15", "status": "Shipped"},
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
          'User Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            const SizedBox(height: 20),
            _buildAddressesSection(),
            const SizedBox(height: 20),
            _buildPaymentMethodsSection(),
            const SizedBox(height: 20),
            _buildOrderHistorySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressesSection() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saved Addresses",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            ...addresses.map((address) => ListTile(
                  title:
                      Text(address, style: GoogleFonts.poppins(fontSize: 14)),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.grey[600]),
                    onPressed: () {},
                  ),
                )),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Color(0xFF36D1DC)),
              label: Text("Add Address",
                  style: GoogleFonts.poppins(color: const Color(0xFF36D1DC))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodsSection() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Methods",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            ...paymentMethods.map((method) => ListTile(
                  title: Text(method, style: GoogleFonts.poppins(fontSize: 14)),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.grey[600]),
                    onPressed: () {},
                  ),
                )),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Color(0xFF36D1DC)),
              label: Text("Add Payment Method",
                  style: GoogleFonts.poppins(color: const Color(0xFF36D1DC))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHistorySection() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order History",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            ...orderHistory.map((order) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Order #${order['orderID']}",
                      style: GoogleFonts.poppins(fontSize: 14)),
                  subtitle: Text(
                    "Date: ${order['date']}\nStatus: ${order['status']}",
                    style: GoogleFonts.poppins(color: Colors.grey[600]),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 14, color: Colors.grey[600]),
                  onTap: () {},
                )),
          ],
        ),
      ),
    );
  }
}
