import 'dart:async';

import 'package:apptravelperu/model/model_travel.dart';
import 'package:apptravelperu/pagina/datalles_place.dart';
import 'package:apptravelperu/servicios/getPlaces.dart';
import 'package:apptravelperu/widgets/ListView_place.dart';
import 'package:apptravelperu/widgets/maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final _destinationController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: 'Descubre',
                    style: const TextStyle(
                      color: Color(0xff8f294f),
                      fontSize: 32,
                      height: 1.3),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' los Mejores Lugares para Viajar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.8)))
                    ]
                  )
                ),
                searchMapCreated(
                  controller: _destinationController,
                  MapCreated: _controller,
                  keybox: 'SearchPlace',
                ),
                const SizedBox(height: 20),
                Container(
                  height: 400,
                  child: GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        initialCameraPosition:
                            CameraPosition(target: LatLng(-13.5167684, -71.9788), zoom: 15.0),
                        myLocationButtonEnabled: true,
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                    )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Lugares populares',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'ver todo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8f294f)),
                    ),
                  ],
                ),
                Container(
                  width: 400,
                  height: 250,
                  margin: const EdgeInsetsDirectional.only(top: 18),
                  child: FutureBuilder(
                    future: getLugares().getListPlaces(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Lugares>> snapshot) {
                      if (snapshot.hasData) {
                        List<Lugares>? listaLugares = snapshot.data;
                        return ListView.builder(
                            itemCount: listaLugares?.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return imagenPlace(listaLugares![index], context);
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Descubrir',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'ver todo',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8f294f)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
