import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'AppState/appState.dart';
import 'SpinKitRotatingCircle.dart';


class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static BitmapDescriptor myIcon;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: SafeArea(child: appState.initialPosition == null
          ? Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SpinKitRotatingCircle(
                    color: Colors.black,
                    size: 50.0,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: appState.locationServiceActive == false,
                child: Text(
                  "Please enable location services!",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              )
            ],
          ))
          : Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: appState.initialPosition, zoom: 10.0),
                onMapCreated: appState.onCreated,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                mapToolbarEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                markers: appState.markers,
                onCameraMove: appState.onCameraMove,
                polylines: appState.polyLines,
              ),),

//          Positioned(
//            top: 50.0,
//            right: 0.0,
//            left: 5.0,
//            child: buildCustomAppbar(),
//          ),
          ])),
    );
  }

}
