import 'dart:io';
import 'dart:typed_data';

import 'package:apptravelperu/servicios/storageGoogle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class imageCloud extends StatefulWidget {
  @override
  State<imageCloud> createState() => _imageCloudState();
}

class _imageCloudState extends State<imageCloud> {
  File? _image;
  Uint8List? _imageBytes;
  String? _imageName;
  final picker = ImagePicker();
  late CloudApi api;

  bool isUploaded = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/credentials.json').then((json) {
      api = CloudApi(json);
    });
  }

  void _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    print(pickedFile);
    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
        _imageBytes = _image!.readAsBytesSync();
        _imageName = _image!.path.split('/').last;
        isUploaded = false;
      } else {
        print('Imagen no seleccionada');
      }
    });
  }

  void _saveImage() async {

    setState(() {
      loading = true;
    });

    final response = await api.save(_imageName!, _imageBytes!);
    print(response.downloadLink);

    setState(() {
      loading = false;
      isUploaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _imageBytes == null
            ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Apoyanos',
                    style: const TextStyle(
                      color: Color(0xff8f294f),
                      fontSize: 32,
                      height: 1.3),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Toma una foto a tu lugar Turísco favorito!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.8)))
                    ]
                  )
                )
            : ListView(
                children: [
                  Image.memory(_imageBytes!),
                  if (loading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (isUploaded)
                    const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: _saveImage,
                      child: Text('Guarda en el Cloud',style: TextStyle(fontSize: 15, letterSpacing: 5.0, fontWeight: FontWeight.w800)),
                      style: TextButton.styleFrom(
                        elevation: 25.0,
                        minimumSize: const Size(120, 40),
                        backgroundColor: Colors.indigo,
                        primary: Colors.white, 
                      ),
                    ),
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[900],
        onPressed: _getImage,
        tooltip: 'Select Image',
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}