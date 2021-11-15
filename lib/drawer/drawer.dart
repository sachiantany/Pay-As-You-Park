import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pay_as_you_park/screens/home.dart';
import 'package:pay_as_you_park/screens/my_balance.dart';
import 'package:pay_as_you_park/screens/packages.dart';
import 'package:pay_as_you_park/screens/subscription_history.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';

class GuestDrawer extends StatefulWidget {

  final DriverStore user;


  const GuestDrawer({Key? key,required this.user}) : super(key: key);

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
            accountName: Text('${widget.user.firstName} ${widget.user.lastName}'),
            accountEmail: Text('${widget.user.userEmail}'),
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
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(user: widget.user),
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.backpack),
            title: Text("Packages"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PackagesScreen(user: widget.user),
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("My Balance"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyBalance(user: widget.user),
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.subscriptions),
            title: Text("Subscriptions History"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubscriptionHistory(user: widget.user),
                )
            ),
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
  static const String subscription = SubscriptionHistory.routeName;
}

