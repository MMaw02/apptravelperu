import 'package:apptravelperu/model/model_travel.dart';
import 'package:flutter/material.dart';

class detallesPlace extends StatelessWidget {
  final Lugares lugares;

  const detallesPlace({Key? key, required this.lugares}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              // Aca va aver error del tamaño
              height: 600,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(lugares.imagen),
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
              onTap: () => print("more menu"),
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
              height: 720,
              width: 120,
              decoration: BoxDecoration(
                  // Agregar efecto transparente
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                      stops: const [0, 1],
                      colors: [Colors.white, Colors.white.withOpacity(.03)])),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            width: 370,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lugares.lugar,
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
                              lugares.rating,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                  text: lugares.direccion,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "\n Pronvincia: " +
                                          lugares.provincia +
                                          " - Región: " +
                                          lugares.region,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      lugares.informacion,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xff8f294f),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Color(0xff8f294f),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextButton(
                              onPressed: () async {},
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
