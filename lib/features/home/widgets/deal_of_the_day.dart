import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of The Day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1568663521381-33b7c467fda0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bGluZ2VyaWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
          //height: 235,
          //fit: BoxFit.cover,//HAVE TO ACTIVE THEM BACK LATER
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            '\$ 999.0',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'HOTSAUCE',
            style: TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1585250047310-592b1805a8aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGluZ2VyaWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1574539602047-548bf9557352?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bGluZ2VyaWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1553944136-9c5591630cee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxpbmdlcmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1525284890203-9ee752d3f44f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxpbmdlcmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1625023489823-c9c1e36d6f2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGxpbmdlcmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          child:  Text(
            'See all deals',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade600,
            ),
          ),
        )
      ],
    );
  }
}
