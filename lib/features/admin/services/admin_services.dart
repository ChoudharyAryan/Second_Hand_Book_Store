import 'dart:io';

import 'package:a_s_c/constants/utils.dart';
import 'package:flutter/material.dart';

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
    try {
      
    } catch(e) {
      showSnackBar(context, e.toString());
    }
  }
}