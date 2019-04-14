import 'package:bottom_sheet/bottom_sheet_stack.dart';
import 'package:bottom_sheet/location_bar.dart';
import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<BottomSheetStackState> _sheetKey = GlobalKey<BottomSheetStackState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: BottomSheetStack(
          key: _sheetKey,
          defaultSheetTop: 400,
          children: <Widget>[
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  final sheetState = _sheetKey.currentState;
                  if (sheetState.isDrawn) {
                    sheetState.switchSheet();
                  }
                },
              ),
            ),
            Positioned.fill(
              top: 0,
              left: 0,
              child: Column(
                children: <Widget>[
                  LocationBar(
                    scaffoldKey: _scaffoldKey,
                    onTapLeft: () {
                      _sheetKey.currentState.switchSheet();
                    },
                  ),
                ],
              ),
            ),
          ],
          sheet: Container(
            height: 800,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}