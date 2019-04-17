import 'indicator_bar.dart';
import 'package:flutter/material.dart';

class LocationBar extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  final VoidCallback onTapIndicator;
  final VoidCallback onTapCloseIcon;
  final VoidCallback onTapNearMeIcon;

  LocationBar({
    Key key,
    @required this.scaffoldKey,
    this.onTapIndicator,
    this.onTapCloseIcon,
    this.onTapNearMeIcon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LocationBarState();
  }
}

class _LocationBarState extends State<LocationBar> {

  GlobalKey<ScaffoldState> get scaffoldKey => widget.scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: widget.onTapCloseIcon,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(const Radius.circular(40.0)),
              ),
              child:Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: IndicatorBar(
            onTap: widget.onTapIndicator,
          ),
        ),
        GestureDetector(
          onTap: widget.onTapNearMeIcon,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(40.0)),
                border: Border.all(color: Colors.grey[200]),
              ),
              child:Icon(
                Icons.near_me,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}