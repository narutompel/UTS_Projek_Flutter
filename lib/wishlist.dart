import 'package:flutter/material.dart';
import 'package:flutter_application_uts/catalog.dart';
import 'package:flutter_application_uts/home.dart';
import 'package:flutter_application_uts/main.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Color.fromARGB(255, 122, 69, 20),
        foregroundColor: Colors.black,
      ),
      body: Consumer<MyAppState>(
        builder: (context, appState, _) {
          if (appState.favorites.isEmpty) {
            return Center(
              child: Text('There is no Wishlist item'),
            );
          } else {
            return ListView.builder(
              itemCount: appState.favorites.length,
              itemBuilder: (context, index) {
                final shoe = appState.favorites[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      shoe.imageShoes,
                      width: 50, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                    ),
                    title: Text(shoe.nameShoes),
                  ),
                );
              },
            );
          }
        },
      ),
      drawer: _myDrawer(context),
    );
  }
}

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Catalog"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CatalogPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_sharp),
            title: const Text("Wishlist"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
