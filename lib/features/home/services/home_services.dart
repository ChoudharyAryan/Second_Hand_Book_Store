import 'dart:convert';

import 'package:a_s_c/constants/error_handeling.dart';
import 'package:a_s_c/constants/global_variables.dart';
import 'package:a_s_c/constants/utils.dart';
import 'package:a_s_c/models/product.dart';
import 'package:a_s_c/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Product>> fetchCategoryProducts({required BuildContext context , required String category}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products?category=$category'),
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
}