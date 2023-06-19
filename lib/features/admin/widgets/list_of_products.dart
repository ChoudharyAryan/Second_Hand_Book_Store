import 'package:a_s_c/features/accounts/widgets/single_product.dart';
import 'package:a_s_c/features/admin/services/admin_services.dart';
import 'package:a_s_c/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListOfProducts extends StatefulWidget {
  const ListOfProducts({super.key});

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  void deleteProduct(Product product , int index) async {
    adminServices.deleteProduct(
      context:context,
      product: product,
      onSucess: (){
        products!.removeAt(index);
        setState(() {});
      }      
      );
  } 

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const SpinKitCircle(
            color: Colors.deepPurple,
          )
        : Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline_rounded),
                          onPressed: () {
                            deleteProduct(productData,index);
                          },
                        )
                      ],
                    )
                  ],
                );
              },
            ),
        );
  }
}
