import 'package:a_s_c/common/widgets/stars.dart';
import 'package:a_s_c/features/auth/widgets/common_widgets/custom_button.dart';
import 'package:a_s_c/features/product_details/services/product_details_services.dart';
import 'package:a_s_c/features/search/screens/search_screen.dart';
import 'package:a_s_c/models/product.dart';
import 'package:a_s_c/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-detail';
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {    
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context,listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(18),
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Icon(
                                CupertinoIcons.search,
                              ),
                            ),
                            hintText: 'Search Amazon.in',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w500),
                            contentPadding: const EdgeInsets.only(top: 5.5),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black38,
                                width: 1,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Icon(
                    Icons.mic,
                    size: 26,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.id!,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Stars(
                    rating: avgRating,
                    size: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
                  .copyWith(bottom: 10),
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map((i) {
                return Builder(
                    builder: (BuildContext context) => Image.network(
                          i,
                          fit: BoxFit.cover,
                        ));
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 450,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: 'Deal Price: ',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '₹',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '${widget.product.price}',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.product.description,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              color: Colors.black12,
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  bname: 'Buy now',
                  onpressed: () {},
                  color: Colors.deepPurple,
                  tcolor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10).copyWith(top: 2),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  bname: 'Add to Cart',
                  onpressed: () {},
                  color: Colors.amber,
                  tcolor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black12,
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rate the Product',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              direction: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                );
              },
              allowHalfRating: true,
              onRatingUpdate: (rating) {
                productDetailsServices.rateProduct(
                  context: context,
                  product: widget.product,
                  rating: rating,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
