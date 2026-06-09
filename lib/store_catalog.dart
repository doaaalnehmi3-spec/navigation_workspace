import 'package:flutter/material.dart';

// Class to hold product structured data
class ProductItem {
  final String title;
  final String details;
  final double price;
  final String imageUrl;
  final String category;

  ProductItem({
    required this.title,
    required this.details,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  // Premium, real global product catalog with high-quality stock images
  final List<ProductItem> products = [
    ProductItem(
      title: 'Wireless Headphones',
      category: 'ELECTRONICS',
      details: 'Premium over-ear wireless headphones with active noise cancellation and 40-hour battery life.',
      price: 129.99,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
    ),
    ProductItem(
      title: 'Smart Fitness Watch',
      category: 'ACCESSORIES',
      details: 'AMOLED display fitness tracker with heart rate monitoring, sleep analysis, and water resistance.',
      price: 249.50,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
    ),
    ProductItem(
      title: 'Waterproof Laptop Bag',
      category: 'LIFESTYLE',
      details: 'Modern design tech backpack with external USB charging port and secure multi-compartments.',
      price: 59.00,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Store Catalog', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return GestureDetector(
              onTap: () async {
                // Navigating and passing the whole product object to details
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: item),
                  ),
                );

                // Handling returned data via custom snackbar
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result.toString()),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }
              },
              child: Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    // Product Image Container
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      child: Image.network(
                        item.imageUrl,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(
                          width: 120,
                          height: 120,
                          child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                        ),
                      ),
                    ),
                    // Product Details Text Container
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.category,
                              style: TextStyle(color: Colors.blue[700], fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '\$${item.price}',
                             style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final ProductItem product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Large Hero Image Section with Back Button
          Stack(
            children: [
              Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 320,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              )
            ],
          ),
          // Product Info Sheet
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                      Text('\$${product.price}', style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(6)),
                    child: Text(product.category, style: TextStyle(color: Colors.blue[800], fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 24),
                  const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 8),
                  Text(product.details, style: const TextStyle(fontSize: 15, color: Colors.black54, height: 1.5)),
                  const Spacer(),
                  // Action Pop Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                      ),
                      onPressed: () {
                        // Returning string results back to main catalog screen
                        Navigator.pop(context, 'Successfully added ${product.title} to your cart!');
                      },
                      child: const Text('Add to Cart & Confirm Order', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}