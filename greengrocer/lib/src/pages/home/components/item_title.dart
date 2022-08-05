import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Imagem
            Image.asset(item.imgUrl),

            //Nome
            Text(
              item.itemName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            //Preço - Unidade
          ],
        ),
      ),
    );
  }
}
