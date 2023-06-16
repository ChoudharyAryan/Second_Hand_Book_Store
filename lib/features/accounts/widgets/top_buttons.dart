import 'package:a_s_c/features/accounts/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: Row(
            children: [
              AccountButton(text: 'Your Orders', onTap: (){}),
              const SizedBox(width: 10,),
              AccountButton(text: 'Turn Seller', onTap: (){}),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: Row(
            children: [
              AccountButton(text: 'Your Wish List', onTap: (){}),
              const SizedBox(width: 10,),
              AccountButton(text: 'Logout', onTap: (){}),
            ],
          ),
        ),
      ],
    );
  }
}