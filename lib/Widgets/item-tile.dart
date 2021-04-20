import 'package:apni_kaksha/Models/item-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart-provider.dart';
import '../Utils/ui-colors.dart';

class ItemTile extends StatelessWidget {
  final ItemModel data;
  const ItemTile({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                data.imageUrl,
                fit: BoxFit.contain,
                height: 200,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$${(data.sellingPrice * (1 - data.discountPer / 100)).toInt()}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '\$${data.sellingPrice.toInt()}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: UiColor.success,
                        ),
                        child: Text(
                          '${data.discountPer.toInt()}% OFF',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${data.itemName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    '${data.sellerShopName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${data.sellingUnitQuantity} ${data.unit.toString().split(".")[1].toLowerCase()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.grey[200],
                        ),
                        child: Consumer<CartProvider>(
                            builder: (context, cartProv, _) {
                          int quantity = cartProv.getItemQuantity(data.itemId);
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              quantity == 0
                                  ? SizedBox(width: 15)
                                  : InkWell(
                                      onTap: () {
                                        cartProv.removeItem(data);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.yellow[800],
                                        radius: 14,
                                        child: Text(
                                          '-',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      ),
                                    ),
                              quantity == 0 ? SizedBox() : SizedBox(width: 10),
                              Text(
                                quantity == 0 ? 'ADD' : '$quantity',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.yellow[800],
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  cartProv.addItem(data);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.yellow[800],
                                  radius: 14,
                                  child: Text(
                                    '+',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
