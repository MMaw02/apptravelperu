import 'package:apptravelperu/model/model_noticias.dart';
import 'package:apptravelperu/servicios/getNews.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<Noticias>> listadoNews;

  @override
  void initState() {
    super.initState();
    listadoNews = getListNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Noticias',
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,)
              ),
              const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Noticias>>(
                future: listadoNews,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Noticias> listaNoticias = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ListView.builder(
                        itemCount: listaNoticias.length,
                        itemBuilder: (BuildContext context, int index) {
                          var news = listaNoticias[index];
                          return Center(
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3.0,
                                    ),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(news.imagen),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    news.titulo,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    news.descripcion,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: ElevatedButton(
                                    onPressed: () {
                                      launch(news.fuente);
                                    },
                                    child: Text(
                                      'Ver más información',
                                      style:
                                          TextStyle(fontSize: 15, color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo,
                                      elevation: 5,
                                      minimumSize: const Size(200, 30),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Text("Bien");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
