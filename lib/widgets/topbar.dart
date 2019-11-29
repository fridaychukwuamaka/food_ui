import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {

  final Widget firstItem;
  final IconData secondItem;
  
  TopBar({@required this.firstItem, @required this.secondItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          firstItem,
        Icon(
          secondItem
        )
      ],
      );
  }
}