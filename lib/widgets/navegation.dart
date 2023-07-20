import 'package:apptravelperu/pagina/inicio.dart';
import 'package:apptravelperu/pagina/mapacompleto.dart';
import 'package:apptravelperu/pagina/noticias.dart';
import 'package:apptravelperu/pagina/hotel.dart';
import 'package:apptravelperu/pagina/photoCloud.dart';
import 'package:flutter/material.dart';

class navegationBarTravel extends StatefulWidget {
  const navegationBarTravel({Key? key}) : super(key: key);

  @override
  State<navegationBarTravel> createState() => _navegationBarTravelState();
}

class _navegationBarTravelState extends State<navegationBarTravel> {
  int currentTab = 0;
  final List<Widget> screens = [
    const InicioPage(),
    HotelPage(),
    imageCloud(),
    const NewsPage()

  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = InicioPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed:() =>  print('Hola mamá'),
                icon: Icon(Icons.menu, color: Colors.pink[900]),
                iconSize: 30
              ),
              Row(
                children: [
                  Text('Perú', style: TextStyle(color: Colors.pink[900], fontSize: 16.0)),
                  Icon(Icons.place, color: Colors.pink[900]),
                ]
              ),
              Icon(Icons.account_circle, color: Colors.pink[900], size: 37)
            ],
          ),
        ),
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        backgroundColor: Colors.pink[900],
        foregroundColor: Colors.white,
        onPressed: () => Navigator.push(context, PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child, 
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) => mapacompleto(),)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = InicioPage();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.pink[900] : Colors.grey,
                        ),
                        Text(
                          'Inicio',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12,
                              color:
                                  currentTab == 0 ? Colors.pink[900] : Colors.grey),
                        )
                      ]),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = HotelPage();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.hotel,
                          color: currentTab == 1 ? Colors.pink[900] : Colors.grey,
                        ),
                        Text(
                          'Hotel',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12,
                              color:
                                  currentTab == 1 ? Colors.pink[900] : Colors.grey),
                        )
                      ]),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = imageCloud();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.perm_media,
                          color: currentTab == 2 ? Colors.pink[900] : Colors.grey,
                        ),
                        Text(
                          'Aportar',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12,
                              color:
                                  currentTab == 2 ? Colors.pink[900] : Colors.grey),
                        )
                      ]),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = NewsPage();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.newspaper,
                          color: currentTab == 3 ? Colors.pink[900] : Colors.grey,
                        ),
                        Text(
                          'Noticias',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12 ,color:currentTab == 3 ? Colors.pink[900] : Colors.grey),
                        )
                      ]),
                ),
              ],
            )
          ]),
        ),
      )
    );
  }
}

