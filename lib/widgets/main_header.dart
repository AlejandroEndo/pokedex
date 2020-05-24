import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex/utils/constants.dart' as Constants;

class MainHeader implements SliverPersistentHeaderDelegate {
  MainHeader({
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding:
          EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0, bottom: 30.0),
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            child: SvgPicture.asset(
              Constants.ASSETS['flatBall'],
              color: Colors.grey[200],
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(0.0)
                  ],
                  stops: [0.3, 1.0],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Text(
              Constants.POKEDEX,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(scrollOpacity(shrinkOffset)),
              ),
            ),
          ),
          Positioned(
            top: 50,
            width: (MediaQuery.of(context).size.width / 3) * 2,
            child: Text(
              Constants.POKEDEX_CONTENT,
              style: TextStyle(
                color: Colors.grey.shade700
                    .withOpacity(scrollOpacity(shrinkOffset)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 15.0,
            right: 15.0,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                fillColor: Colors.grey[200],
                hintText: Constants.SEARCH_HINT,
                prefixIcon: Icon(
                  Icons.search,
                ),
                focusColor: Colors.grey[400],
                hoverColor: Colors.grey[400],
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double scrollOpacity(double shrinkOffset) {
    double a = 1.0 - max(0.0, shrinkOffset) / (maxExtent / 3);
    print(a);
    return a < 0.0 ? 0.0 : a;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
