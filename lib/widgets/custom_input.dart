import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final void Function(String) onChanged;
  String hintText;
  bool obscureText;
  IconData prefixIconData;
  String keybox;

  TextFieldWidget({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.obscureText,
    required this.prefixIconData,
    required this.keybox,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingrese su ${widget.hintText}',
                style: const TextStyle(height: 3.0)),
            TextField(
                key: ValueKey(widget.keybox),
                onChanged: widget.onChanged,
                obscureText: widget.obscureText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  prefixIcon: Icon(widget.prefixIconData,
                      size: 20, color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue)),
                  labelStyle: TextStyle(color: Colors.black),
                  focusColor: Colors.blue,
                )),
          ],
        ));
  }
}
