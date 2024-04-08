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
              'Only this price \$${shoe.priceShoes.toStringAsFixed(2)} and you will have a wonderful walk with the shoes. Everyone did, now its your time.',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
