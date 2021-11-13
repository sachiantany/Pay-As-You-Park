import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pay_as_you_park/screens/home.dart';

class GuestDrawer extends StatefulWidget {
  final firstName;
  final lastName;
  final email;

  const GuestDrawer({Key? key,@required this.firstName,@required this.lastName,@required this.email}) : super(key: key);

  @override
  _GuestDrawerState createState() => _GuestDrawerState();
}

class _GuestDrawerState extends State<GuestDrawer> {
  void signOut() async {

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${widget.firstName} ${widget.lastName}'),
            accountEmail: Text('${widget.email}'),
            currentAccountPicture: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: AssetImage("assets/images/admin_avatar.png"))
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_parking),
            title: Text("Search Park"),
            onTap: () => Navigator.pushReplacementNamed(context, Routers.home),
          ),
          ListTile(
            leading: Icon(Icons.backpack),
            title: Text("Packages"),
            onTap: () => Navigator.pushReplacementNamed(context, Routers.home),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Subscriptions"),
            onTap: () => Navigator.pushReplacementNamed(context, Routers.home),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: signOut,
          )
        ],
      ),
    );
  }
}

class Routers {
  static const String home = HomeScreen.routeName;
}

