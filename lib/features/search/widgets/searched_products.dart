import 'package:a_s_c/common/widgets/stars.dart';
import 'package:a_s_c/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchedProducts extends StatelessWidget {
  final Product product;
  const SearchedProducts({super.key, required this.product});  

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for(int i = 0; i<product.rating!.length;i++){
      totalRating+=product.rating![i].rating;      
    }
    double avgRating = 0; 
    if(totalRating != 0){
      avgRating = totalRating/product.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.cover,
                height: 180,
                width: 150,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child:  Stars(
                      rating: avgRating,
                      size: 25,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '₹',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${product.price}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: const Text(
                      'Free shipping',
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      '${product.quantity} in Stock',
                      style: const TextStyle(fontSize: 18, color: Colors.teal),
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
