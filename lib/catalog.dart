import 'package:flutter/material.dart';
import 'package:flutter_application_uts/main.dart';
import 'package:flutter_application_uts/home.dart';
import 'package:flutter_application_uts/wishlist.dart';
import 'shoesDetail.dart';

class Shoe {
  final String nameShoes;
  final String imageShoes;
  final double priceShoes;

  Shoe({required this.nameShoes, required this.imageShoes, required this.priceShoes});
}

List<Shoe> shoeCatalog = [
  Shoe(nameShoes: 'Puma RS-X', imageShoes: 'aset/images/catalog1.jpg', priceShoes: 250.0),
  Shoe(nameShoes: 'DC Whiteee', imageShoes: 'aset/images/catalog2.jpg', priceShoes: 100.0),
  Shoe(nameShoes: 'Howe R x W', imageShoes: 'aset/images/catalog3.jpg', priceShoes: 160.0),
  Shoe(nameShoes: 'Yeezy Reed', imageShoes: 'aset/images/catalog4.jpg', priceShoes: 180.0),
  Shoe(nameShoes: 'Converse Grin', imageShoes: 'aset/images/catalog5.jpg', priceShoes: 120.0),
  Shoe(nameShoes: 'Converse Play Pewds', imageShoes: 'aset/images/catalog6.jpg', priceShoes: 190.0),
  Shoe(nameShoes: 'Nike Blue-Star', imageShoes: 'aset/images/catalog7.jpg', priceShoes: 200.0),
  Shoe(nameShoes: 'Nike Semi-run', imageShoes: 'aset/images/catalog8.jpg', priceShoes: 110.0),
  Shoe(nameShoes: 'Nike Air Max', imageShoes: 'aset/images/catalog9.jpg', priceShoes: 160.0),
  Shoe(nameShoes: 'VX Ultraboost', imageShoes: 'aset/images/catalog10.jpg', priceShoes: 200.0),
];

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        backgroundColor: Color.fromARGB(255, 122, 69, 20),
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: shoeCatalog.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShoeDetailsPage(shoe: shoeCatalog[index]),
                ),
              );
            },
            child: ShoeCard(shoe: shoeCatalog[index]),
          );
        },
      ),
      drawer: _myDrawer(context),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            shoe.imageShoes,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.nameShoes,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  '\$${shoe.priceShoes.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ShoeDetailsPage extends StatelessWidget {
//   final Shoe shoe;

//   const ShoeDetailsPage({Key? key, required this.shoe}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(shoe.nameShoes),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               shoe.imageShoes,
//               height: 200,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               '\$${shoe.priceShoes.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             // Add more details about the shoe as needed
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget _myDrawer(BuildContext context) {
  return SizedBox(
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: Image(
              image: AssetImage('aset/images/Profile.png'),
            ),
            accountName: Text("Putu Adi Saputra"),
            accountEmail: Text("putujackson0@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1533861225287-75902a93f681?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_2_sharp),
            title: const Text("Profile"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Catalog"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_sharp),
            title: const Text("Wishlist"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WishlistPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log out"),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
