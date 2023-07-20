import 'package:apptravelperu/model/model_travel.dart';
import 'package:apptravelperu/pagina/datalles_place.dart';
import 'package:flutter/material.dart';

Widget imagenPlace(Lugares lugares, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 16.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => detallesPlace(lugares: lugares),
            ));
      },
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Image.network(
            lugares.imagen,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(lugares.lugar,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  )),
            ))
      ]),
    ),
  );
}
