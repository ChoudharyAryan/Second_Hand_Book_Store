import 'package:a_s_c/features/home/widgets/address_box.dart';
import 'package:a_s_c/features/product_details/screens/product_details.dart';
import 'package:a_s_c/features/search/services/search_services.dart';
import 'package:a_s_c/features/search/widgets/searched_products.dart';
import 'package:a_s_c/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchServices searchServices = SearchServices();
  List<Product>? productList;
  @override
  void initState() {
    fetchSearchedProduct();
    super.initState();
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  fetchSearchedProduct() async {
    productList = await searchServices.fetchSearchedProduct(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
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
      body: productList == null
          ? const SpinKitCircle(
              color: Colors.deepPurple,
            )
          : Column(
              children: [
                const AddressBox(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shoping for ${widget.searchQuery}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: productList!.length,
                    itemBuilder: (context, index) {
                      final productData = productList![index];
                      return GestureDetector(
                        onTap: () {

                          Navigator.pushNamed(
                            context,
                            ProductDetailsScreen.routeName,
                            arguments: productList![index],
                          );
                        },
                        child: SearchedProducts(
                          product: productData,
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
