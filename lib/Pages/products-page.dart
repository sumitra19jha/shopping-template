import 'package:apni_kaksha/Widgets/item-tile.dart';
import 'package:apni_kaksha/Widgets/products-app-bar.dart';
import 'package:flutter/material.dart';
import '../Utils/dummy-data.dart';

class ProductsPage extends StatelessWidget {
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
                  ProductsAppBar(),
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
                            return ItemTile(data: items[index]);
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
