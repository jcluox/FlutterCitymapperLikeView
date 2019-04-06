import 'package:flutter/material.dart';

class LocationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationBarState();
  }
}

class _LocationBarState extends State<LocationBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
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
        Expanded(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: 25, height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
                Text(
                  '地點',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
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
      ],
    );
  }
}