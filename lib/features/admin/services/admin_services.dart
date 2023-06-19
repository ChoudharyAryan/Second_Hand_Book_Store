import 'dart:convert';
import 'dart:io';

import 'package:a_s_c/constants/error_handeling.dart';
import 'package:a_s_c/constants/global_variables.dart';
import 'package:a_s_c/constants/utils.dart';
import 'package:a_s_c/models/product.dart';
import 'package:a_s_c/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('duiqzusr9', 'yrwcakd5');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            resourceType: CloudinaryResourceType.Image,
            folder: name,
          ),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'auth_token': userProvider.user.token,
          },
          body: product.toJson());

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {            
            showSnackBar(
              context,
              'Product added successfully!',
            );
            Navigator.pop(context);
          });
          
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //GETTING ALL PRODUCTS
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-products'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'auth_token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList
                .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
          }
        },
      );
    } catch (e) {      
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  //DELETING PRODUCT
  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSucess,
    }) async {
      final userProvider = Provider.of<UserProvider>(context, listen: false);      
    try {

      http.Response res = await http.post(Uri.parse('$uri/admin/delete-product'),
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'auth_token': userProvider.user.token,
        },
      body: jsonEncode({'id' : product.id}));

      httpErrorHandle(
        response: res, 
        context: context, 
        onSucess:onSucess,
        );
    } catch(e) {
      showSnackBar(context, e.toString());
    }
  }
}
