import 'dart:async';

import 'package:apptravelperu/widgets/maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapacompleto extends StatefulWidget {
  @override
  State<mapacompleto> createState() => _mapacompletoState();
}

class _mapacompletoState extends State<mapacompleto> {
  final _destinationController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
              initialCameraPosition: CameraPosition(target: LatLng(-13.5167684, -71.9788), zoom: 15),
              myLocationButtonEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
            ),
          ),
          searchMapCreated(controller: _destinationController, MapCreated: _controller, keybox: 'Maps',),

          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       // alignLabelWithHint: true,
          //       // floatingLabelAlignment: FloatingLabelAlignment.center,
          //       border: InputBorder.none,
          //       hintText: 'Has tu busqueda',
          //       filled: true,
          //       enabledBorder: UnderlineInputBorder(
          //         borderSide: BorderSide.none,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}