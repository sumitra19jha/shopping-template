import 'package:apni_kaksha/Providers/cart-provider.dart';
import 'package:apni_kaksha/Utils/size-config.dart';
import 'package:apni_kaksha/Utils/ui-colors.dart';
import 'package:apni_kaksha/Widgets/checkout-button.dart';
import 'package:apni_kaksha/Widgets/checkout-tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            title: Text(
              'Your Cart',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'OpenSans',
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.green[800],
                            width: SizeConfig.screenWidth,
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(
                              children: [
                                Text(
                                  'Today: 11am - noon',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'OpenSans',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green[500],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'FREE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'OpenSans',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ...cartprovider.getCartItemList.map(
                            (data) {
                              return CheckoutItemTile(cartItem: data);
                            },
                          ).toList(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
