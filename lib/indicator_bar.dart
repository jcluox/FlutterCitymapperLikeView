import 'package:flutter/material.dart';

class IndicatorBar extends StatefulWidget {

  final VoidCallback onTap;
  final String message;
  final bool showProgressIndicator;

  IndicatorBar({
    Key key,
    this.onTap,
    this.message = '',
    this.showProgressIndicator = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndicatorBarState();
  }
}

class _IndicatorBarState extends State<IndicatorBar> {

  VoidCallback get onTap => widget.onTap;
  String get message => widget.message;
  bool get showIndicator => widget.showProgressIndicator;

  @override
  Widget build(BuildContext context) {

    var children = <Widget>[
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Icon(
            Icons.search,
            color: Colors.blue,
          )
      ),
    ];
    if (showIndicator) {
      var indicator = Padding(
        padding: EdgeInsets.only(right: 10),
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(),
        ),
      );
      children.add(indicator);
    }
    var mainAxisAlignment = showIndicator ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(const Radius.circular(50.0)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            ),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}