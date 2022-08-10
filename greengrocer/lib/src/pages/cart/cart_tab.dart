import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom.colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/services/util_services.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilServices utilServices = UtilServices();

  //REMOVER ITEM DO CARRINHO
  void removeItemFromCart(CartItemModel cartITem) {
    setState(() {
      appData.cartItems.remove(cartITem);
    });
  }

  //TOAL GERAL DO PREÇO DO CARRINHO
  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          //LISTA DE ITENS DO CARRINHO
          Expanded(
            child: ListView.builder(
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                    cartItem: appData.cartItems[index],
                    remove: removeItemFromCart);
              },
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total geral',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  utilServices.PriceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //BOTÃO CONCLUIR PEDIDO
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      print(result);
                    },
                    child: Text(
                      'concluir pedido',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text('Confirmação'),
            content: Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Não'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Sim'),
              ),
            ],
          );
        });
  }
}
