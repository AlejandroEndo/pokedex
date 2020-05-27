import 'package:flutter/material.dart';

class RowTable extends StatelessWidget {
  final String title;
  final Widget child;
  RowTable({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: child,
        ),
      ],
    );
  }
}
