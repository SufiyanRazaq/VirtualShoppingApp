import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:google_fonts/google_fonts.dart';

class VirtualTourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF141E30),
        title: Text(
          'Virtual 3D Tour',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          PhotoView(
            imageProvider: const AssetImage('assets/store.webp'),
            backgroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2.0,
          ),
          Positioned(
            left: 100,
            top: 150,
            child:
                _buildTouchpoint(context, "Product 1", "assets/product1.webp"),
          ),
          Positioned(
            right: 80,
            top: 250,
            child:
                _buildTouchpoint(context, "Product 2", "assets/product2.webp"),
          ),
          Positioned(
            left: 150,
            bottom: 200,
            child:
                _buildTouchpoint(context, "Product 3", "assets/product3.webp"),
          ),
        ],
      ),
    );
  }

  Widget _buildTouchpoint(
      BuildContext context, String productName, String productImage) {
    return GestureDetector(
      onTap: () {
        _showProductDialog(context, productName, productImage);
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(Icons.info,
                size: 40, color: Colors.white.withOpacity(0.9)),
          ),
          const SizedBox(height: 8),
          Text(
            productName,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDialog(
      BuildContext context, String productName, String productImage) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    productImage,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  productName,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF141E30),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "This is a detailed view of $productName. Tap below to explore more or to chat with a shop assistant for more information.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF36D1DC),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    "Close",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
