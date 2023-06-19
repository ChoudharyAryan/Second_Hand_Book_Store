// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:a_s_c/constants/error_handeling.dart';
import 'package:a_s_c/constants/global_variables.dart';
import 'package:a_s_c/constants/utils.dart';
import 'package:a_s_c/models/product.dart';
import 'package:a_s_c/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http; 

class ProductDetailsServices {
  void rateProduct ({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      print('SENDING HTTP REQUEST TO UPDATE THE RATING IN DATABASE');
      http.Response res = await http.post(Uri.parse('$uri/api/rate-product'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'auth_token': userProvider.user.token,
          },
          body: jsonEncode({
            'id': product.id!,
            'rating': rating,
    })
          );
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {},
      );

    }catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  }
