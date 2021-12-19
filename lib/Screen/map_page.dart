import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled5/Screen/home_page.dart';
import '../HTTP/http_service.dart';
import '../HTTP/list_user_response.dart';
import '../HTTP/user.dart';
//Map page
class map_page extends StatefulWidget {
  @override
  map_pageState createState() => map_pageState();
}

class map_pageState extends State<map_page> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> markers = <Marker>[];

  bool isLoading = false;
  HttpService http;
  ListUserResponse listUserResponse;
  List<User> users;
  // to get the data form API assigned into a list.
  Future getListUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getRequest("/api/users?page=2");
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response.data);
          users = listUserResponse.users;
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    http = HttpService();
    //the list is build a the begin
    getListUser();
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    //to control the arrow back when clicked!
    return WillPopScope(
      onWillPop: ()=> Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => home()),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            //for showing the map and the widget two method are created.!
            _buildGoogleMap(context),
            _buildContainer(),
          ],
        ),
      ),
    );
  }
  // custom container is build here
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 150.0,
          // list builder the get the data from API as a list
          child: users != null
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    const SizedBox(width: 10.0);
                    const Padding(padding: EdgeInsets.all(8.0));
                    return _boxes(
                        user.avatar,
                        user.firstName,
                        user.lastName,
                        user.email,
                        21.553380,
                        39.145360);
                  },
                  itemCount: users.length,
                )
              : const Center(
                  child: Text("No User Object"),
                )),
    );
  }
  //Design is created to show the list of data
  Widget _boxes(String _id, String First,  String mail,
      String Last, double lat, double long) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: const Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(_id),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer(First, mail, Last),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String First, String mail, String Last) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                First,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Last,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          )),
        ),
        const SizedBox(height: 10.0),
        Container(
            child: Text(
          mail,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        const SizedBox(height: 5.0),
        Container(
            child: const Text(
          "From 09:00 To 17:00 ",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
  //here is the widget is used to show the map on the app.!
  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        zoomGesturesEnabled: true,
        mapType: MapType.satellite,
        initialCameraPosition: const CameraPosition(
            target: LatLng(21.543333, 39.172779), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers),
      ),
    );
  }
  //This method is used to get the location when item is clicked.!
  Future<void> _gotoLocation(double lat, double long) async {
    setState(() {
      markers.clear();
    });
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 18,
      tilt: 25.0,
      bearing: 45.0,
    )));
    setState(() {
      markers.add(const Marker(
        //add first marker
        markerId: MarkerId('Test'),
        draggable: false,
        visible: true,
        position: LatLng(21.553380, 39.145360),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(const Marker(
        //add second marker
        markerId: MarkerId('Test2'),
        draggable: false,
        visible: true,
        position: LatLng(21.553220, 39.143910),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
  }
}
