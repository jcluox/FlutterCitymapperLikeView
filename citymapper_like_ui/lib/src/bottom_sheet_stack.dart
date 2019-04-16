import 'package:flutter/material.dart';

class BottomSheetStack extends StatefulWidget {
  final double defaultSheetTop;
  final Widget sheet;
  final List<Widget> children;
  final double maxSheetHeight;

  const BottomSheetStack({
    Key key,
    @required this.defaultSheetTop,
    @required this.sheet,
    @required this.children,
    this.maxSheetHeight,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomSheetStackState();
  }
}

class BottomSheetStackState extends State<BottomSheetStack> with TickerProviderStateMixin {

  bool isDrawn = false;
  double _sheetTop;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void switchSheet() {
    final screenHeight = MediaQuery.of(context).size.height;

    double begin, end;
    if (isDrawn) {
      begin = _sheetTop;
      end = screenHeight;
      isDrawn = false;
    } else {
      begin = _sheetTop ?? screenHeight;
      end = screenHeight - widget.defaultSheetTop;
      isDrawn = true;
    }
    _animation = Tween<double>(begin: begin, end: end).animate(_controller);
    _controller
      ..value = 0
      ..fling()
      ..addListener(() {
        setState(() {
          _sheetTop = _animation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final sheetLayout = Positioned(
      left: 0,
      top: _sheetTop ?? screenHeight,
      width: screenWidth,
      child: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            _sheetTop += details.delta.dy;
            final maxSheetHeight = widget.maxSheetHeight;
            if (maxSheetHeight != null) {
              if (screenHeight - _sheetTop > maxSheetHeight) {
                _sheetTop = screenHeight - maxSheetHeight;
              }
            }
          });
        },
        onVerticalDragEnd: (DragEndDetails details) {
          setState(() {
            if (_sheetTop > screenHeight - widget.defaultSheetTop) {
              isDrawn = _sheetTop <= (screenHeight - widget.defaultSheetTop/2);
              double toTop = isDrawn ? screenHeight - widget.defaultSheetTop : screenHeight;
              _animation = Tween<double>(begin: _sheetTop, end: toTop).animate(_controller);
              _controller..value = 0..fling();
            }
          });
        },
        child: widget.sheet,
      ),
    );

    var children = <Widget>[];
    children.addAll(widget.children);
    children.add(sheetLayout);
    return Stack(children: children);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}