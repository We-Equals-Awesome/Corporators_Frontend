import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoder/geocoder.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:cropapp/Screens/Complaints/complaint_page_2.dart';

class MapPage extends StatefulWidget {
  final Coordinates defaultCoordinates;
  MapPage(this.defaultCoordinates);
  //MapPage({Key key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    Future<void> requestPermission() async {
      await Permission.location.request();
    }
  }

  Set<Marker> _marker = {};
  Coordinates selectedCod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: GoogleMap(
            onTap: handleTap,
            markers: Set.from(_marker),
            onMapCreated: mapCreated,
            initialCameraPosition:
                CameraPosition(target: LatLng(12.9716, 77.5946), zoom: 15),
          ),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.06,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ComplaintsPage2(selectedCod, 1)));
            },
            label: Text(
              'Submit',
              style: TextStyle(
                  color: navIcon, fontSize: 13.0, fontFamily: 'ProductSans'),
            ),
            backgroundColor: submitGrey,
          ),
        ));
  }

  void handleTap(LatLng tappedPoint) {
    setState(() {
      _marker = {};
      _marker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: true,
          onDragEnd: (dragEndPosition) {
            print(dragEndPosition);
          }));
      selectedCod = Coordinates(tappedPoint.latitude, tappedPoint.longitude);
      print('coodrinates :' + selectedCod.toString());
    });
  }

  void mapCreated(GoogleMapController controller) {
    setState(() {
      _marker.add(
        Marker(
            markerId: MarkerId('id -1 '),
            position: LatLng(widget.defaultCoordinates.latitude,
                widget.defaultCoordinates.longitude)),
      );
    });
  }
}
