import 'package:flutter/material.dart';
import 'package:pay_as_you_park/constants/assets.dart';
import 'home.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // Image(
              //   height: 200.0,
              //   width: double.infinity,
              //   // image: AssetImage(
              //   //   ,
              //   // ),
              //   image: AssetImage(Assets.appLogo),
              //   color: Colors.deepPurpleAccent,
              //   fit: BoxFit.cover,
              // ),

              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blueAccent,
                        Colors.lightBlueAccent,
                      ],
                    )
                )
              ),


              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.0,
                          // color: Theme.of(context).primaryColor,
                          color: Colors.white70
                        ),
                      ),
                      child: ClipOval(
                        child: Image(image: AssetImage('assets/icons/profile.png'),),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      'Test User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.home),
            'Home',
                () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.chat), 'Complaints', () => {
            print('J')
          }),
          _buildDrawerOption(Icon(Icons.info), 'About Us', () {}),
          // _buildDrawerOption(
          //   Icon(Icons.account_circle),
          //   'Your Profile',
          //       () => Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => ProfileScreen(
          //         user: currentUser,
          //       ),
          //     ),
          //   ),
          // ),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(Icon(Icons.directions_run),'Logout', () {}),
              ),
            ),
        ],
      ),
    );
  }
}
