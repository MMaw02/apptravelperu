import 'package:apptravelperu/model/model_hotel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detallesHotel extends StatefulWidget {
  final Hotels Hotel;

  const detallesHotel({Key? key, required this.Hotel}) : super(key: key);

  @override
  State<detallesHotel> createState() => _detallesHotelState();
}

class _detallesHotelState extends State<detallesHotel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(widget.Hotel.imagen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * .6,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                      stops: const [0, 1],
                      colors: [Colors.white, Colors.white.withOpacity(.03)])),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            width: size.width * .9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.Hotel.hotel,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_half,
                            color: Color(0xff8f294f),
                            size: 22,
                          ),
                          Text(
                            widget.Hotel.estrella,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xff8f297f),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'S./',
                                style: TextStyle(
                                  color: Colors.black87.withOpacity(.5),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.Hotel.precio.toString() +
                                        '  /por dia',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.fmd_good_outlined,
                            color: Color(0xff8f294f),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: TextSpan(
                            text: " ${widget.Hotel.direccion}",
                            style: TextStyle(
                              color: Colors.black87.withOpacity(.5),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.Hotel.descripcion,
                    style: const TextStyle(
                      color: Color(0xff686771),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.Hotel.descripcion,
                    style: const TextStyle(
                      color: Color(0xff686771),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Color(0xff8f294f),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: const Color(0xff8f294f),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () async {
                              launch('tel://${widget.Hotel.contacto}');
                            },
                            child: Text('Descúbrelo',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.pink[900],
                              minimumSize: Size(380.0, 50.0),
                              elevation: 0.0,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
