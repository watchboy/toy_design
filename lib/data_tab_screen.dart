import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/screen_size.dart';

class DateTabScreen extends StatefulWidget {
  DateTabScreen({Key? key}) : super(key: key);

  @override
  _DateTabScreenState createState() => _DateTabScreenState();
}

class _DateTabScreenState extends State<DateTabScreen> {
  List<Marker> _markers = [];
  bool _visible = false;
  double centerLng =0;
  double centerLat =0;
  Position? currentPosition;


  @override
  void initState() {
    // TODO: implement initState
    getPosition();

    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () {
          setState(() {
            _visible = !_visible;
          });
        },
        position: LatLng(37.4537251, 126.7960716)));
  }

  Future<void> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      setState(() {
        centerLat = position.latitude;
        centerLng = position.longitude;
        print('지금 포지션은 $centerLng, $centerLat');
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return centerLng == 0 ? Container(child: Center(child:Text('loading map..', style: TextStyle(fontFamily: 'Avenir-Medium', color: Colors.grey[400]),),),) : Stack(
      children: [
        Container(
          child: SizedBox(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: Set.from(_markers),
              onCameraMove: (_) {},
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(centerLat,centerLng),zoom: 14.4746),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: size!.width,
              height: size!.height * 0.3,
              child: Center(
                  child: Text(
                '대박나자 ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border.all(width: 0.1)),
            ),
          ),
        )
      ],
    );
  }
}
