import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool obscuringText;
  final int maxline;
  const CustomTextfield({Key? key,
  required this.controller,
  required this.hinttext, 
  required this.obscuringText,this.maxline = 1}) 
  :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: true,
      obscureText: obscuringText,
      obscuringCharacter: '*',
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white,
        border:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
      validator: (val){
        if(val == null || val.isEmpty){
          return 'Please enter your $hinttext';
        }
        return null;
      },
      maxLines: maxline,
    );
  }
}