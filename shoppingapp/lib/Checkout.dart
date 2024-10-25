// checkout_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/OrderConfirmation.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedAddress = '1234 Main St, Springfield, USA';
  String selectedPaymentMethod = 'Credit Card';

  List<String> addresses = [
    '1234 Main St, Springfield, USA',
    '4321 Market St, Springfield, USA'
  ];

  List<String> paymentMethods = ['Credit Card', 'Wallet'];

  double totalAmount = 99.99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141E30),
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Delivery Address",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedAddress,
              onChanged: (newValue) {
                setState(() {
                  selectedAddress = newValue!;
                });
              },
              items: addresses.map((address) {
                return DropdownMenuItem(
                  value: address,
                  child: Text(
                    address,
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                );
              }).toList(),
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF36D1DC)),
              underline: Container(),
            ),
            const SizedBox(height: 20),
            Text(
              "Select Payment Method",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  selectedPaymentMethod = newValue!;
                });
              },
              items: paymentMethods.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(
                    method,
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                );
              }).toList(),
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF36D1DC)),
              underline: Container(),
            ),
            const SizedBox(height: 20),
            Text(
              "Order Summary",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF141E30),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSummaryItem("Subtotal",
                        "\$${(totalAmount - 10).toStringAsFixed(2)}"),
                    _buildSummaryItem("Shipping", "\$10.00"),
                    const Divider(),
                    _buildSummaryItem(
                        "Total", "\$${totalAmount.toStringAsFixed(2)}"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderConfirmationPage(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Order placed successfully!"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36D1DC),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Place Order',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF141E30),
            ),
          ),
        ],
      ),
    );
  }
}
