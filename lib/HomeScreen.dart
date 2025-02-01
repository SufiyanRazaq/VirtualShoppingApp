import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/CartPage.dart';
import 'package:shoppingapp/Notification.dart';
import 'package:shoppingapp/ProductDetailPage.dart';
import 'package:shoppingapp/Profile.dart';
import 'package:shoppingapp/SearchPage.dart';
import 'package:shoppingapp/StoreDetailPage.dart';
import 'package:shoppingapp/StoreDirectory.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141E30),
        title: Text(
          'Virtual Mall',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: const Icon(Icons.notifications, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(),
                ),
              );
            },
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            child: const Icon(Icons.shopping_cart, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartPage(),
                ),
              );
            },
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            child: const Icon(Icons.store, color: Colors.white),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StoreDirectoryPage(),
                ),
              );
            },
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Text("Search stores or products...",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Take a Virtual Tour',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Featured Stores',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF141E30),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildStoreCard(
                        'assets/store1.webp', 'ElectroMart', context),
                    buildStoreCard('assets/store2.webp', 'FashionHub', context),
                    buildStoreCard(
                        'assets/store3.webp', 'GroceryMart', context),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF141E30),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryCard(Icons.devices, 'Electronics'),
                    buildCategoryCard(Icons.shopping_bag, 'Fashion'),
                    buildCategoryCard(Icons.local_grocery_store, 'Grocery'),
                    buildCategoryCard(Icons.home, 'Home Decor'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Recommended For You',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF141E30),
                ),
              ),
              const SizedBox(height: 10),
              buildRecommendedStoreList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoreCard(
      String imagePath, String storeName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StoreDetailPage(
              storeName: storeName,
              storeCategory: 'Category',
              storeImage: imagePath,
              storeDescription:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus eros vitae urna malesuada, eu aliquam mauris hendrerit. Proin vel dui arcu. Etiam arcu nisl, euismod sed velit interdum, fermentum pretium magna. Sed mattis nibh dolor, nec consectetur turpis tristique ut. Ut ultricies at nisl vel sagittis. Morbi imperdiet ullamcorper dui, porttitor laoreet nulla. ',
            ),
          ),
        );
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 10),
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
            color: Colors.black.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(
            storeName,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryCard(IconData icon, String categoryName) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C5364),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 8),
          Text(
            categoryName,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommendedStoreList(BuildContext context) {
    return Column(
      children: [
        buildRecommendedStoreItem(
            context, 'assets/store4.webp', 'SuperStore', 'Grocery', 19.99),
        buildRecommendedStoreItem(context, 'assets/store5.webp',
            'Home Essentials', 'Home Decor', 45.50),
        buildRecommendedStoreItem(
            context, 'assets/store6.webp', 'Fashion World', 'Fashion', 29.99),
      ],
    );
  }

  Widget buildRecommendedStoreItem(BuildContext context, String imagePath,
      String storeName, String category, double price) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              productName: storeName,
              productImage: imagePath,
              productDescription:
                  'Detailed description of $storeName showcasing quality, features, and more.',
              productPrice: price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
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
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  category,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
