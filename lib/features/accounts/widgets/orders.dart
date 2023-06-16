import 'package:a_s_c/features/accounts/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //TEMPORARY LIST
  List list = [    
    'https://img.freepik.com/free-vector/colorful-business-landing-page_52683-988.jpg?size=626&ext=jpg&ga=GA1.1.1129355174.1685745680&semt=sph',
    'https://img.freepik.com/premium-psd/laptop-psd-mockup-with-gradient-led-light_53876-138283.jpg?size=626&ext=jpg&ga=GA1.1.1129355174.1685745680&semt=sph',
    'https://img.freepik.com/premium-psd/close-up-floating-laptop-mockup_308775-6.jpg?size=626&ext=jpg&ga=GA1.1.1129355174.1685745680&semt=sph',
    'https://img.freepik.com/premium-psd/close-up-floating-laptop-mockup_308775-6.jpg?size=626&ext=jpg&ga=GA1.1.1129355174.1685745680&semt=sph',
    'https://img.freepik.com/free-photo/laptop-table_53876-176755.jpg?size=626&ext=jpg&ga=GA1.1.1129355174.1685745680&semt=sph',    
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade600),
              ),
            ),
          ],
        ),
        //DISPLAYING ORDERS
        Container(
          height: 200,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              return SingleProduct(image:list[index]);
          },
          ),
        )
      ],
    );
  }
}
