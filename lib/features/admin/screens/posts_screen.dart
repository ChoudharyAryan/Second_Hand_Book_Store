import 'package:a_s_c/features/admin/screens/add_product_screen.dart';
import 'package:a_s_c/features/admin/widgets/list_of_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void addProductScreen(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:FloatingActionButtonLocation.startFloat,
      body: const ListOfProducts(),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        tooltip: 'Add product',
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: 30,          
          ),
          onPressed: (){
            addProductScreen();
          },
      ),
    );
  }
}