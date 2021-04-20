import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart-provider.dart';
import '../Utils/ui-colors.dart';

class ProductsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: UiColor.success,
      floating: false,
      pinned: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rice & other grains',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: 'OpenSans',
            ),
          ),
          Text(
            'Super Store Indrapuram',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        Consumer<CartProvider>(builder: (ctx, cartProv, _) {
          int cartUniqueItems = cartProv.getCartItemList.length;
          return cartUniqueItems == 0
              ? IconButton(
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_basket_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: UiColor.danger,
                      child: Text(
                        '$cartUniqueItems',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                );
        }),
        SizedBox(width: 5)
      ],
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.only(
            top: 65,
            left: 10,
            right: 10,
            bottom: 25,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/Images/pic1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
