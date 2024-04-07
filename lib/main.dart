import 'package:flutter/material.dart';
import 'package:flutter_application_uts/catalog.dart';
import 'package:flutter_application_uts/home.dart';
import 'package:flutter_application_uts/wishlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static myDrawer(BuildContext context) {}
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project UTS',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header:
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        backgroundColor:
            Color.fromARGB(255, 122, 69, 20), // Ubah warna latar belakang
        foregroundColor: const Color.fromARGB(255, 0, 0, 0), // Ubah warna teks
      ),
      // body:
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.zero,
            child: Image.network(
                "https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
          ),
          const ListTile(
            title: Text("Putu Adi Saputra"),
            subtitle: Text("Name"),
          ),
          const ListTile(
            title: Text("Male"),
            subtitle: Text("Gender"),
          ),
          const ListTile(
            title: Text("085339966280"),
            subtitle: Text("Phone Number"),
          ),
          const ListTile(
            title: Text("putuad1saputr4@gmail.com"),
            subtitle: Text("Email"),
          ),
          const ListTile(
            title: Text("17 November 2022"),
            subtitle: Text("Date of Birth"),
          ),
        ],
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
                    fit: BoxFit.cover)),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const  WishlistPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const  HomePage()));
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
