import 'package:a_s_c/features/home/services/home_services.dart';
import 'package:a_s_c/features/product_details/screens/product_details.dart';
import 'package:a_s_c/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  final HomeServices homeServices = HomeServices();
  List<Product>? productList;
  @override
  void initState() {
    fetchCategoryProducts();
    super.initState();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18)),
          ),
          title: Text(widget.category)),
      body: productList == null
          ? const SpinKitCircle(
              color: Colors.deepPurple,
            )
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shoping for ${widget.category}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: productList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 1.7,
                      // mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final productData = productList![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailsScreen.routeName,
                            arguments: productData,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  //color: Colors.amber,
                                  alignment: Alignment.center,
                                  height: 200,
                                  child: Image.network(
                                    productData.images[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                  left: 0,
                                  top: 5,
                                ),
                                child: Text(
                                  productData.name,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
