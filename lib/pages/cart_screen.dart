import 'package:app/components/custom_card.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Data> products;
  final Set<int> cartIds;
  const CartScreen({super.key, required this.products, required this.cartIds});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products
        .where((element) => widget.cartIds.contains(element.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.white),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_checkout_outlined,
                              size: 64,
                              color: Colors.grey,
                            ),

                            SizedBox(height: 16),

                            Text(
                              "Your cart is empty",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 12),

                            Text(
                              "Add items to start shopping",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final data = cartProducts[index];

                          return Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F7),
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(data.image ?? ""),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        data.title ?? "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text(
                                        data.category ?? "",
                                        style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      widget.cartIds.remove(data.id ?? 0);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),

              SizedBox(height: 6),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  "By continuing, you agree that your personal data will be processed in accordance with our Privacy Policy (GDPR/KVKK compliance).",
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),

              SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Checkout", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
