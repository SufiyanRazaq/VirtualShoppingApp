import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDirectoryPage extends StatefulWidget {
  @override
  _StoreDirectoryPageState createState() => _StoreDirectoryPageState();
}

class _StoreDirectoryPageState extends State<StoreDirectoryPage> {
  final List<Map<String, String>> stores = [
    {
      'name': 'ElectroMart',
      'category': 'Electronics',
      'image': 'assets/store1.webp'
    },
    {
      'name': 'FashionHub',
      'category': 'Fashion',
      'image': 'assets/store2.webp'
    },
    {
      'name': 'GroceryMart',
      'category': 'Grocery',
      'image': 'assets/store3.webp'
    },
    {
      'name': 'Home Essentials',
      'category': 'Home Decor',
      'image': 'assets/store5.webp'
    },
    {
      'name': 'SuperStore',
      'category': 'Grocery',
      'image': 'assets/store4.webp'
    },
    {
      'name': 'Fashion World',
      'category': 'Fashion',
      'image': 'assets/store6.webp'
    },
  ];

  String selectedCategory = 'All';
  List<String> categories = [
    'All',
    'Electronics',
    'Fashion',
    'Grocery',
    'Home Decor'
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredStores = selectedCategory == 'All'
        ? stores
        : stores
            .where((store) => store['category'] == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF141E30),
        title: Text(
          'Store Directory',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by Category:',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedCategory == category
                            ? const Color(0xFF36D1DC)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        category,
                        style: GoogleFonts.poppins(
                          color: selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: filteredStores.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.5,
                ),
                itemBuilder: (context, index) {
                  return buildStoreCard(
                    filteredStores[index]['image']!,
                    filteredStores[index]['name']!,
                    filteredStores[index]['category']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStoreCard(String imagePath, String storeName, String category) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              storeName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              category,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
