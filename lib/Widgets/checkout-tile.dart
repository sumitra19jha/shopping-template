import 'package:apni_kaksha/Providers/cart-provider.dart';
import 'package:apni_kaksha/Utils/ui-colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutItemTile extends StatelessWidget {
  final CartItem cartItem;
  const CheckoutItemTile({Key key, @required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) => Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                title: Text(
                  cartItem.item.itemName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: UiColor.warning,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                        child: Text(
                          '${cartItem.item.sellingUnitQuantity} ${cartItem.item.unit.toString().split('.')[1].toLowerCase()}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '₹ ${((cartItem.item.sellingPrice * (1 - cartItem.item.discountPer / 100)) * cartProvider.getItemQuantity(cartItem.item.itemId)).toStringAsFixed(2)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'OpenSans',
                          color: UiColor.darkShades,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            cartProvider.removeItem(cartItem.item);
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[100],
                            child: Icon(
                              Icons.remove,
                              color: UiColor.darkShades,
                              size: 24,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          cartProvider
                              .getItemQuantity(cartItem.item.itemId)
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: UiColor.darkShades,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            cartProvider.addItem(cartItem.item);
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[100],
                            child: Icon(
                              Icons.add,
                              color: UiColor.darkShades,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
