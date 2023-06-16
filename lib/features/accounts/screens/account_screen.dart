import 'package:a_s_c/features/accounts/widgets/below_appbar.dart';
import 'package:a_s_c/features/accounts/widgets/orders.dart';
import 'package:a_s_c/features/accounts/widgets/top_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 45,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                    bottom: 15,
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications),
                      ),
                      Icon(CupertinoIcons.search)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: const Column(
        children: [BelowAppBar(),
        SizedBox(height: 10,),
        TopButtons(),
        SizedBox(height: 25,),
        Orders()
        ],
      ),
    );
  }
}
