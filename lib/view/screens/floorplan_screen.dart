import 'package:custom_zoomable_floorplan/core/viewmodels/floorplan_model.dart';
import 'package:custom_zoomable_floorplan/view/widgets/appbar_widget.dart';
import 'package:custom_zoomable_floorplan/view/widgets/floorplan_gridview/gridview_widget_A01.dart';
import 'package:custom_zoomable_floorplan/view/widgets/floorplan_gridview/gridview_widget.dart';
import 'package:custom_zoomable_floorplan/view/widgets/floorplan_gridview/gridview_widget_A04.dart';
import 'package:custom_zoomable_floorplan/view/widgets/overlay_widget.dart';
import 'package:custom_zoomable_floorplan/view/widgets/raw_gesture_detector_widget.dart';
import 'package:custom_zoomable_floorplan/view/widgets/reset_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

// void main() {
//   String value;
//   runApp(
//     /// 1. Wrap your App widget in the Phoenix widget
//     Phoenix(
//       child: FloorPlanScreen(value),
//     ),
//   );
// }

class FloorPlanScreen extends StatelessWidget {
  const FloorPlanScreen(this.value);
  final String value;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FloorPlanModel>(context);
    String slot = value;

    //var slot = "A00";
    if (slot == "A00") {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBarWidget(),
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            color: Color(0xff02011c), //02011c
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RawGestureDetectorWidget(
                    child: GridViewWidget(),
                  ),
                  // model.hasTouched ? ResetButtonWidget() : OverlayWidget()
                  ResetButtonWidget()
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 48.0,
                  //   child: TextButton(
                  //     style: TextButton.styleFrom(
                  //       backgroundColor: Colors.red,
                  //       primary: Colors.white,
                  //     ),
                  //     child: const Text('Phoenix.rebirth(context);'),

                  //     /// 2. Call Phoenix.rebirth(context) to rebuild your app
                  //     onPressed: () => Phoenix.rebirth(context),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (slot == "A04") {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBarWidget(),
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            color: Color(0xff02011c), //02011c
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RawGestureDetectorWidget(
                    child: GridViewWidgetA04(),
                  ),
                  // model.hasTouched ? ResetButtonWidget() : OverlayWidget()
                  ResetButtonWidget()
                ],
              ),
            ),
          ),
        ),
      );
    } else if (slot == "A01") {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBarWidget(),
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            color: Color(0xff02011c), //02011c
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RawGestureDetectorWidget(
                    child: GridViewWidgetA01(),
                  ),
                  // model.hasTouched ? ResetButtonWidget() : OverlayWidget()
                  ResetButtonWidget()
                ],
              ),
            ),
          ),
        ),
      );
    }
    throw NullThrownError();
  }
}
