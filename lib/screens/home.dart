import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_as_you_park/utils/routes/routes.dart';
import 'package:pay_as_you_park/widgets/textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '8',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {  },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Home'),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLogoutButton(),
    ];
  }

  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }

}
