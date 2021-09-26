import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_as_you_park/model/directions_model.dart';
import 'package:pay_as_you_park/services/directions_repository.dart';
import 'package:pay_as_you_park/utils/routes/routes.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  late Marker marker;
  late Circle circle;
  late GoogleMapController _controller;
  late Marker _destination;
  late double destinationLat;
  late double destinationLon;
  late String parkingYardId;
  late Directions _info;



  bool marker_active = false;
  bool destination_active = false;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(6.0535, 80.2210),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/icons/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!.toDouble(), newLocalData.longitude!.toDouble());
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!.toDouble(),
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy!.toDouble(),
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      marker_active = true;

      /*if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }*/


      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude!.toDouble(), newLocalData.longitude!.toDouble()),
              tilt: 0,
              zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
      _controller.dispose();

    }
    super.dispose();
  }

  void getDestination() async {
    getCurrentLocation();
    destinationLat = 6.9271;
    destinationLon = 79.8612;

    LatLng latlng = LatLng(destinationLat,destinationLon);
    this.setState(() {
      _destination = Marker(
          markerId: MarkerId("destination"),
          position: latlng,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
    });

    final directions = await DirectionsRepository()
        .getDirections(origin: marker.position, destination: latlng);
    setState(() => _info = directions!);

    destination_active = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(alignment: Alignment.center,children: <Widget>[
        GoogleMap(
        mapToolbarEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker_active != false) ? [marker] : []),
        circles: Set.of((marker_active != false) ? [circle] : []),
          polylines: {
            if (destination_active != false)
              Polyline(
                polylineId: const PolylineId('overview_polyline'),
                color: Colors.red,
                width: 5,
                points: _info.polylinePoints
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList(),
              ),
          },
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        ),
        Positioned(
            bottom: 110,
            left: 20,
            child: FloatingActionButton(
              child: Icon(Icons.location_searching),
              heroTag: 1,
              onPressed: () {
                getCurrentLocation();
              },
            )),
        Positioned(
            bottom: 50,
            left: 20,
            child: FloatingActionButton(
              child: Icon(Icons.local_parking),
              heroTag: 2,
              onPressed: () {
                //getCurrentLocation();
                getDestination();
              },
            )),
        if (destination_active != false)
          Positioned(
            top: 20.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Text(
                '${_info.totalDistance}, ${_info.totalDuration}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ]),
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
