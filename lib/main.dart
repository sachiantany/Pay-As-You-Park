import 'package:custom_zoomable_floorplan/core/models/getLocationModel.dart';
import 'package:custom_zoomable_floorplan/core/viewmodels/floorplan_model.dart';
import 'package:custom_zoomable_floorplan/service/getLocation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'view/screens/floorplan_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();
  String _value = "";

  showToast() => Fluttertoast.showToast(
      msg: "Please Select a Slot",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  onClickSendVariables() {
    String valStr = _value;
    if (_value != "") {
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
            new NextPage(value: _value.toString()),
      );
      Navigator.of(context).push(route);
    } else {
      showToast();
    }

    // Navigator.push(
    //     context,
    //     new MaterialPageRoute(
    //         builder: (BuildContext context) => new FloorPlanScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/images/floorPlanInitial.jpg',
                          width: 250, height: 450, fit: BoxFit.fill),
                    ),
                    ListTile(title: Text('')),
                  ],
                ),
              ),
            ),
          ),
          new Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                'Please Choose the Parking Slot',
                style: TextStyle(
                    color: Color(0xff02011c), fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )),
          new Container(
            margin: EdgeInsets.fromLTRB(50, 10, 60, 20),
            padding: const EdgeInsets.fromLTRB(50, 10, 10, 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(2.5, 5.5),
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: DropdownButton<String>(
                value: _value,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 42,
                items: [
                  DropdownMenuItem(
                    child: Text("Please Select the Slot"),
                    value: "",
                  ),
                  DropdownMenuItem(
                    child: Text("A01"),
                    value: "A01",
                  ),
                  DropdownMenuItem(
                    child: Text("A04"),
                    value: "A04",
                  )
                ],
                onChanged: (String? value) {
                  setState(() {
                    _value = value.toString();
                  });
                }),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              'Only Free Parking Slots are Avaialable in the List',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Container(
              margin:
                  const EdgeInsets.only(top: 10.0, left: 120.0, right: 120.0),
              child: SizedBox(
                child: ElevatedButton(
                    child: Text("Submit".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, //background color of button
                        side: BorderSide(width: 3, color: Color(0xff02011c)),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20)),
                    onPressed: () {
                      onClickSendVariables();
                    }),
              ))
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key? key, required this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState(value);
}

class _NextPageState extends State<NextPage> {
  _NextPageState(this.value);
  String value;
  @override
  Widget build(BuildContext context) {
    Future<GetLocationModel> _locationsModel;
    _locationsModel = Service().getIndoorLocationDetails();
    print(_locationsModel);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FloorPlanModel>(
            create: (context) => FloorPlanModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FloorPlanScreen(value),
      ),
    );
  }
}
