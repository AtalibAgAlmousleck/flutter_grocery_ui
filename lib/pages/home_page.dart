import 'package:flutter/material.dart';
import 'package:grocery_ui/component/grocery_item.dart';
import 'package:grocery_ui/model/cart_modal.dart';
import 'package:grocery_ui/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CartPage();
          }),
        ),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 48),
            // good mornig
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text('Good morning!'),
            ),
            // order items
            SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 24),

            //divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),

            SizedBox(height: 24),

            //fresh items
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresg items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            //Sliver
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    ); //GroceryItemTile();
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
