import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart-provider.dart';
import './dummy-data.dart';
import './item-model.dart';
import './ui-colors.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              headerSliverBuilder: (ctx, innerBoxIsSrolled) {
                return <Widget>[
                  SliverAppBar(
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
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        isScrollable: false,
                        labelColor: Colors.yellow[800],
                        unselectedLabelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorWeight: 3,
                        indicatorColor: Colors.yellow[800],
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(text: "Basmati"),
                          Tab(text: "Kolam"),
                          Tab(text: "Other Rice"),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: DummyDataSet.getItemDAta
                    .map(
                      (items) => Container(
                        color: Colors.grey[200],
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (ctx, index) {
                            return _item(items[index]);
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(ItemModel data) {
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
