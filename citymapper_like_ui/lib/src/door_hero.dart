import 'package:flutter/material.dart';

void closeDoor(BuildContext context, Door door) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) {
        return SafeArea(
          child: Scaffold(
            body: door,
          ),
        );
     }
    )
  );
}

void openDoor(BuildContext context) {
  Navigator.of(context).pop();
}

class Door extends StatefulWidget {

  final Widget topWidget;
  final Widget bottomWidget;
  final double topHeight;
  final double bottomHeight;
  final Object topTag;
  final Object bottomTag;

  Door({
    Key key,
    @required this.topWidget,
    @required this.bottomWidget,
    this.topHeight,
    this.bottomHeight,
    @required this.topTag,
    @required this.bottomTag,
  }): assert((topWidget!=null && bottomHeight==null) || (topWidget==null && bottomHeight!=null) ),
    assert(topWidget != null && bottomWidget != null),
    assert(topTag != null && bottomTag != null),
    super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoorState();
  }
}

class DoorState extends State<Door> {

  Object get topTag => widget.topTag;
  Object get bottomTag => widget.bottomTag;
  double get topHeight => widget.topHeight;
  double get bottomHeight => widget.bottomHeight;
  Widget get topWidget => widget.topWidget;
  Widget get bottomWidget => widget.bottomWidget;

  @override
  Widget build(BuildContext context) {
    var children;
    if (topHeight == null) {
      children = [
        Expanded(
          child: DoorHero(
            tag: topTag,
            child: topWidget,
          ),
        ),
        DoorHero(
          tag: bottomTag,
          child: Container(
            height: bottomHeight,
            child: bottomWidget,
          ),
        ),
      ];
    } else {
      children = [
        DoorHero(
          tag: topTag,
          child: Container(
            height: topHeight,
            child: topWidget,
          ),
        ),
        Expanded(
          child: DoorHero(
            tag: bottomTag,
            child: bottomWidget,
          ),
        ),
      ];
    }

    return Column(children: children);
  }
}

class DoorHero extends StatelessWidget {

  final Object tag;
  final Widget child;

  DoorHero({
    Key key,
    @required this.tag,
    this.child,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: child,
        ),
      ),
    );
  }
}

enum ShadowDoorDirection {TOP, BOTTOM}

Widget makeShadowDoor(BuildContext context, {
  Object tag,
  Widget child,
  double topDoorHeight,
  ShadowDoorDirection direction = ShadowDoorDirection.TOP
}) {
  assert(tag != null && topDoorHeight != null);
  final size = MediaQuery.of(context).size;
  double top, height;
  if (direction == ShadowDoorDirection.TOP) {
    top = -topDoorHeight;
    height = topDoorHeight;
  } else {
    top = size.height;
    height = size.height - topDoorHeight;
    if (height < 0.0) { height = 0;}
  }
  return Positioned(
    top: top,
    left: 0,
    width: size.width,
    height: height,
    child: DoorHero(tag: tag, child: child),
  );
}