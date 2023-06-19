import 'dart:io';

import 'package:a_s_c/features/admin/services/admin_services.dart';
import 'package:a_s_c/features/auth/widgets/common_widgets/custom_button.dart';
import 'package:a_s_c/features/auth/widgets/common_widgets/custom_textfield.dart';
import 'package:a_s_c/constants/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add_product_screen';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late final TextEditingController _productcontroller;
  late final TextEditingController _desccontroller;
  late final TextEditingController _pricecontroller;
  late final TextEditingController _quantitycontroller;
  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _productcontroller = TextEditingController();
    _desccontroller = TextEditingController();
    _pricecontroller = TextEditingController();
    _quantitycontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _productcontroller.dispose();
    _desccontroller.dispose();
    _pricecontroller.dispose();
    _quantitycontroller.dispose();
    super.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: _productcontroller.text,
        description: _desccontroller.text,
        price: double.parse(_pricecontroller.text),
        quantity: double.parse(_quantitycontroller.text),
        category: category,
        images: images,
      );
    }
  }

  void selctImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
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
          title: const Text(
            'Add Product',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ));
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                          autoPlay: true,
                        ),
                      )
                    : GestureDetector(
                        onTap: selctImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open_rounded,
                                  size: 45,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Select Product images',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                  controller: _productcontroller,
                  hinttext: 'Product Name',
                  obscuringText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: _desccontroller,
                  hinttext: 'Description',
                  obscuringText: false,
                  maxline: 7,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: _pricecontroller,
                  hinttext: 'Price',
                  obscuringText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: _quantitycontroller,
                  hinttext: 'Quantity',
                  obscuringText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(
                      CupertinoIcons.down_arrow,
                    ),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    color: Colors.deepPurple,
                    tcolor: Colors.white,
                    bname: 'SELL',
                    onpressed: sellProduct,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
