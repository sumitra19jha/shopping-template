import 'package:apni_kaksha/Providers/cart-provider.dart';
import 'package:apni_kaksha/Utils/size-config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, orderProvider, _) => Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: BorderRadius.circular(45),
        ),
        width: SizeConfig.screenWidth,
        child: ListTile(
          onTap: () async {},
          leading: Icon(
            Icons.create,
            color: Colors.white,
          ),
          title: Text(
            'Generate Order',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '\$ ${orderProvider.getTotalAmount}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.navigate_next,
                size: 24,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
