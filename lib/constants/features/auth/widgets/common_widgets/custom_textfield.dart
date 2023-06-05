import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  const CustomTextfield({Key? key,
  required this.controller,
  required this.hinttext}) 
  :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white,
        border:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
      validator: (val){},
    );
  }
}