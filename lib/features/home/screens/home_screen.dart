import 'package:a_s_c/features/home/widgets/address_box.dart';
import 'package:a_s_c/features/home/widgets/crousel_image.dart';
import 'package:a_s_c/features/home/widgets/deal_of_the_day.dart';
import 'package:a_s_c/features/home/widgets/top_catagories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: AppBar(         
          title: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 42,
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(8),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            hintText: 'Search Amazon.in',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500
                              ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Icon(CupertinoIcons.search),
                            ),
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
                                )),
                          ),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15
                  ),
                  child: const Icon(Icons.mic, size: 26),
                )
              ],
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(height: 10,),
            TopCatogries(),
            SizedBox(height: 10,),
            CrouselImage(),
            DealOfDay()
          ],
        ),
      ),
    );
  }
}
