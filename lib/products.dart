import 'package:apni_kaksha/ui-colors.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Location',
                  style: TextStyle(
                    fontSize: 14,
                    color: UiColor.darkShades,
                  ),
                ),
                Text(
                  'B-52 Tecorbbuilding, sec-63 Noida',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: UiColor.darkShades,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: UiColor.darkShades,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  color: UiColor.darkShades,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (ctx, innerBoxIsSrolled) {
              return <Widget>[];
            },
            body: Container(
              child: ListView(),
            ),
          ),
        ),
      ),
    );
  }
}
