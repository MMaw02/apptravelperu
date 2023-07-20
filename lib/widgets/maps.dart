import 'dart:async';

import 'package:apptravelperu/servicios/getMaps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class searchMapCreated extends StatefulWidget {
  TextEditingController controller;
  Completer MapCreated;
  String keybox;

  searchMapCreated(
      {Key? key,
      required this.controller,
      required this.MapCreated,
      required this.keybox})
      : super(key: key);

  @override
  State<searchMapCreated> createState() => _searchMapCreatedState();
}

class _searchMapCreatedState extends State<searchMapCreated> {
  // final _destinationController = TextEditingController();
  // Completer<GoogleMapController> _controller = Completer();
  List<Place> _predictions = [];

  void _inputOnChanged(String query) {
    PlaceApi()
        .searchPredictions(query)
        .asStream()
        .listen((List<Place> predictions) {
      setState(() {
        _predictions = predictions;
      });
    });
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await widget.MapCreated.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 15)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(3),
            child: TextField(
              key: ValueKey(widget.keybox),
              controller: widget.controller,
              onChanged: _inputOnChanged,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.place, color: Colors.pink[900]),
                  suffixIcon: Icon(Icons.search, color: Colors.pink[900]),
                  border: InputBorder.none,
                  hintText: '¿A donde quiere viajar?',
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          ),
          if (widget.controller.text != "" && widget.controller.text != null)
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  backgroundBlendMode: BlendMode.darken),
              child: Container(
                child: ListView.builder(
                  itemCount: _predictions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Place item = _predictions[index];
                    return ListTile(
                      title: Text(item.mainText,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(item.secondaryText,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400)),
                      leading: const Icon(Icons.location_on),
                      onTap: () async {
                        widget.controller.text = "";
                        widget.controller.clear();

                        var place = await PlaceApi().getPlaceId(item.placeId);

                        return _goToPlace(place);
                      },
                    );
                  },
                ),
              ),
            )
        ],
      ),
    );
  }
}
