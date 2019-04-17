import 'package:citymapper_like_ui/citymapper_like_ui.dart';
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

  final topDoorHeight = 250.0;

  GlobalKey<BottomSheetStackState> _sheetKey = GlobalKey<BottomSheetStackState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomSheetStack(
          key: _sheetKey,
          defaultSheetHeight: 400,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        _sheetKey.currentState.switchSheet();
                      },
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: IndicatorBar(
                        onTap: () {
                          closeDoor(context, Door(
                            topTag: 'this is top tag',
                            bottomTag: 'this is bottom tag',
                            topHeight: topDoorHeight,
                            topWidget: Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Icon(Icons.arrow_back),
                                    onTap: () {
                                      openDoor(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            bottomWidget: Container(color: Colors.green),
                          ));
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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
              ),
            ),
            makeShadowDoor(
              context,
              direction: ShadowDoorDirection.TOP,
              topDoorHeight: topDoorHeight,
              tag: 'this is top tag',
              child: Container(color: Colors.blue,child: null),
            ),
            makeShadowDoor(
              context,
              direction: ShadowDoorDirection.BOTTOM,
              topDoorHeight: topDoorHeight,
              tag: 'this is bottom tag',
              child: Container(color: Colors.green, child: null),
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