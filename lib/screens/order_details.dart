import 'package:flutter/material.dart';
import 'package:checkout/widgets/circular_avatar.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() {
    return _OrderDetailsScreenState();
  }
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 6,
        title: Center(
          child: Text('Order Details'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Order Id: IJE774888K',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            _buildDeliveryStatusRow(),
            _buildOrderDetailsCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Total Item(s): 1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildProductDetailsCard(),
            _buildMyListView()
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryStatusRow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircularAvatar(
            backgroundColor: Colors.black.withValues(alpha: 0.7),
            child: Icon(
              Icons.local_shipping,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Status:',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Out for Delivery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${DateTime.now().toLocal().toString().split(' ')[0]} ${TimeOfDay.now().format(context)}',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement order tracking logic
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Track Order'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailsCard() {
    final DateTime now = DateTime.now();
    final DateTime estimatedArrival = now.add(Duration(days: 2));

    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'IJE774888K',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '${now.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  CircularAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.storefront,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download, color: Colors.black),
                  label: Text(
                    'Invoice',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Estimated Arrival',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${estimatedArrival.toLocal().toString().split(' ')[0]}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetailsCard() {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 140,
            margin: EdgeInsets.only(left: 6, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/200/300?random=1',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Product Details
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Organic Whole Wheat Bread',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Brand: Bakery Fresh',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Category: Bakery',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Freshly baked whole wheat bread, made with 100% organic ingredients. Perfect for a healthy breakfast or sandwich.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'R19.99',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyListView() {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double remainingHeight = constraints.maxHeight; // Get dynamic height
          double listItemHeight = remainingHeight / 3; // Divide by 3

          return Container(
            color: Colors.green, 
            child: ListView.builder(
              itemCount: 3, // 3 items
              itemBuilder: (context, index) {
                return Container(
                  height: listItemHeight, // Each item takes 1/3 of container
                  color: index.isEven ? Colors.white : Colors.grey[300],
                  child: Center(child: Text("Item $index")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
