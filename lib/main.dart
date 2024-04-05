import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project UTS',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
    );
  }
}