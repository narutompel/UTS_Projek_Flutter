import 'package:flutter/material.dart';

class TrendShoes extends StatelessWidget {
  final String imagePath;
  final String shoesName;
  final String rating;
  final String peopleBought;
  const TrendShoes({
      required this.imagePath,
      required this.shoesName,
      required this.rating,
      required this.peopleBought,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
              elevation: 10,
            child: Column(
              children: [
                SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset(imagePath, fit: BoxFit.cover,),
                  )
              ],
            ),
          ), 
          Positioned(
            bottom: 0,
            left: 10,
            child: SizedBox(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoesName, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(
                        width: 5,
                      ),
                      Text(rating),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.shopping_bag_rounded, color: Colors.black
                        ),
                        SizedBox(
                        width: 5,
                      ),
                      Text(
                        peopleBought
                        )
                    ],)
                ],),
              ),)
        ],
      ),
    );
  }
}
