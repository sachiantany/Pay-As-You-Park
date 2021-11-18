import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_as_you_park/constants/strings.dart';
import 'package:pay_as_you_park/drawer/drawer.dart';
import 'package:pay_as_you_park/model/subscription.dart';
import 'package:pay_as_you_park/services/subscription_service.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';
import 'package:pay_as_you_park/utils/routes/routes.dart';
import 'dart:async';
import 'package:http/http.dart' as http;



class MyBalance extends StatefulWidget {

  final DriverStore user;

  static const String routeName = '/subscription';

  MyBalance({Key? key, required this.user}) : super(key: key);
  @override
  _MyBalanceState createState() => _MyBalanceState();
}

class _MyBalanceState extends State<MyBalance> {

  List<Subscription> listModel =  [];
  int availableBalance = 0;
  var loading = false;

  Future<Null> getData() async{
    setState(() {
      loading = true;
    });

    //final responseData = await SubscriptionService().getSubscriptionHistory(widget.user.userEmail);
    final responseData = await http.get(Uri.parse("https://pay-as-you-park-mobile-server.herokuapp.com/subscription/active_subscription/"+widget.user.userEmail));
    final res_availableBalance = (await http.get(Uri.parse("https://pay-as-you-park-mobile-server.herokuapp.com/subscription/acc_bal/"+widget.user.userEmail)));
    if(responseData!=null){
      print(res_availableBalance);
      final data = jsonDecode(responseData.body);
      availableBalance = jsonDecode(res_availableBalance.body);
      print(data);
      setState(() {
        for(Map i in data){
          listModel.add(Subscription.fromJson(i));
        }
        loading = false;
      });
    }
  }

  void _showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _buildAppBar(),
        drawer: GuestDrawer(user: widget.user),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            topArea(),
            Expanded(
                child: loading ? Center (child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: listModel.length,
                    itemBuilder: (context, i){
                      final nDataList = listModel[i];
                      return Container(
                          child: InkWell(
                              onTap: (){

                              },
                              child: subscriptionCard(nDataList.package_name,nDataList.minute,nDataList.price,nDataList.balance)
                          )
                      );
                    })
            )
          ]),
        ));
  }

  Widget subscriptionCard(String packageName, int minutes, int price,int balance){

    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10.0,
      margin: EdgeInsets.all(10.0),

      child: new Container(
        padding:  new EdgeInsets.all(14.0),

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:new Text(
                  packageName+' (Rs '+price.toString()+')',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                ),
              ],
            ),

            SizedBox(height: 10.0,),


            new Text(
              'Package Limit :'+minutes.toString() + ' minutes',
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.0,),

            new Text(
              'Available balance :'+balance.toString() + ' minutes',
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
    );
  }


  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('My Balance'),
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

  Card topArea() => Card(
    margin: EdgeInsets.all(10.0),
    elevation: 10.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xFF015FFF), Color(0xFF015FFF)])),
        padding: EdgeInsets.all(5.0),
        // color: Color(0xFF015FFF),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Available Balance',
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(availableBalance.toString()+' minutes',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
            SizedBox(height: 35.0),
          ],
        )),
  );
}
