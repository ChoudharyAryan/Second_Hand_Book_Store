// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String bname;
  final VoidCallback onpressed;
  const CustomButton({
    Key? key,
    required this.bname,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: CupertinoButton(
        color: Colors.white,
        onPressed: onpressed,
        child:  Text(
          bname,
          style: const TextStyle(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
