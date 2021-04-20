import 'package:apni_kaksha/ui-colors.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> images = [
    'assets/Images/pic1.jpg',
    'assets/Images/pic2.jpg',
  ];

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
                      onPressed: () {
                        //Navigator.of(context).pop();
                      },
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          //Navigator.of(context).pop();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          //Navigator.of(context).pop();
                        },
                      ),
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
                children: [1, 2, 3]
                    .map(
                      (items) => Container(
                        color: Colors.grey[200],
                        child: ListView(),
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
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
