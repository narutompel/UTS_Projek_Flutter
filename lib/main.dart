import 'package:flutter/material.dart';
import 'package:flutter_application_uts/catalog.dart';
import 'package:flutter_application_uts/home.dart';
import 'package:flutter_application_uts/wishlist.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAppState()),
      ],
      child: MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
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

class MyAppState extends ChangeNotifier {
  List<Shoe> _favorites = []; // Menyimpan daftar favorit

  List<Shoe> get favorites => _favorites;

  void toggleFavorite(Shoe shoe) {
    if (_favorites.contains(shoe)) {
      _favorites.remove(shoe); // Hapus dari daftar favorit jika sudah ada
    } else {
      _favorites.add(shoe); // Tambahkan ke daftar favorit jika belum ada
    }
    notifyListeners(); // Memberi tahu pendengar tentang perubahan
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;
  List<UserInfo> _userInfoList = [
    UserInfo(title: "Name", value: "Putu Adi Saputra"),
    UserInfo(title: "Gender", value: "Male"),
    UserInfo(title: "Phone Number", value: "085339966280"),
    UserInfo(title: "Email", value: "putuad1saputr4@gmail.com"),
    UserInfo(title: "Date of Birth", value: "17 November 2022"),
  ];
  List<UserInfo> _editedUserInfoList = [];

  @override
  void initState() {
    super.initState();
    _editedUserInfoList.addAll(_userInfoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 122, 69, 20),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: ListView.builder(
        itemCount: _userInfoList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildProfileImage();
          }
          final userInfo = _editedUserInfoList[index - 1];
          return ListTile(
            title: _isEditing
                ? TextFormField(
                    initialValue: userInfo.value,
                    onChanged: (newValue) {
                      _editedUserInfoList[index - 1] = UserInfo(
                        title: userInfo.title,
                        value: newValue,
                      );
                    },
                  )
                : Text(userInfo.value),
            subtitle: Text(userInfo.title),
          );
        },
      ),
      drawer: _myDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_isEditing) {
              _userInfoList = List.from(_editedUserInfoList);
            }
            _toggleEditing();
          });
        },
        backgroundColor: Colors.brown,
        child: Icon(_isEditing ? Icons.save : Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
        ),
      ),
    );
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }
}

class UserInfo {
  final String title;
  final String value;

  UserInfo({required this.title, required this.value});
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
