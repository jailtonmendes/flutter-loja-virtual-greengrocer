import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom.colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(
          style: TextStyle(
            fontSize: 30,
          ),
          TextSpan(
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Badge(
            badgeColor: CustomColors.customContrastColor,
            badgeContent: Text('2'),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: CustomColors.customSwatchColor,
            ),
          ),
        ],
      ),

      //Campo de pesquisa

      //Categorias

      //Grid
    );
  }
}
