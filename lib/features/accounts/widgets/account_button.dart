import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text; 
  final VoidCallback onTap;
  const AccountButton({Key? key, required this.text, required this.onTap}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: const EdgeInsets.only(top: 15,bottom: 15,right: 55,left: 55),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: Colors.deepPurple,
        onPressed: onTap,
        child: Text(text,style: const TextStyle(fontWeight: FontWeight.w500),),
        ),
    );
  }
}