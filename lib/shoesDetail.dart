import 'package:flutter/material.dart';
import 'catalog.dart'; // Import file catalog.dart untuk mengakses kelas Shoe

class ShoeDetailsPage extends StatelessWidget {
  final Shoe shoe;

  const ShoeDetailsPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.nameShoes),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              shoe.imageShoes,
              height: 200,
            ),
            SizedBox(height: 16.0),
            Text(
              '\$${shoe.priceShoes.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            // Add more details about the shoe as needed
          ],
        ),
      ),
    );
  }
}
