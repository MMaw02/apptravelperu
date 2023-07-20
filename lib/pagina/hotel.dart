import 'package:apptravelperu/model/model_hotel.dart';
import 'package:apptravelperu/pagina/detalles_hotel.dart';
import 'package:apptravelperu/servicios/getHotel.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hoteles',
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,)
            ),
            const SizedBox(height: 20),
            Expanded(
                child: FutureBuilder<List<Hotels>>(
                  future: getHoteles().getListHotels(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Hotels> _listaHoteles = snapshot.data!;
                      return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _listaHoteles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => detallesHotel(Hotel: _listaHoteles[index])));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            //padding: const EdgeInsets.only(left: 24,right: 24,top: 8,bottom: 16),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              elevation: 5,
                              //color: Colors.amber,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all( Radius.circular(15) ),
                                child: AspectRatio(
                                  aspectRatio: 2.7,
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 0.90,
                                            child: Image.network(
                                              _listaHoteles[index].imagen,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(_listaHoteles[index].hotel,
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(_listaHoteles[index].direccion,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff686771),
                                                  ), 
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                                          children: [
                                                            const Text('Estrellas:',
                                                              style: TextStyle(
                                                              fontSize: 14,
                                                              color: Color(0xff686771),
                                                              ), 
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              width: 90,
                                                              child: ListView.builder(
                                                                // double estrellas = double.tryParse(_listaHoteles[index].estrella);
                                                                scrollDirection: Axis.horizontal,
                                                                itemCount: int.tryParse(_listaHoteles[index].estrella),
                                                                itemBuilder: (BuildContext context ,int index){
                                                                return const Icon(Icons.star, color:Color(0xff8f294f),size: 15);
                                                              }),
                                                            )
                                                          ],
                                                        )),
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 15),
                                                        child: Column(
                                                          children:  [
                                                            Text('S./'+_listaHoteles[index].precio.toString()),
                                                            const Text('/por dia',style: TextStyle( fontSize: 12,color: Color(0xff686771)),)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ), 
                                                ),
                                              ],
                                            )
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                    });
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 25),
                      //   child: ListView.builder(itemBuilder: itemBuilder), 
                      // );

                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Text("Bien");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
          ]
      )
      )
    );
  }
}
