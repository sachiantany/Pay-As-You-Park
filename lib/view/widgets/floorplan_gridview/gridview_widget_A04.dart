import 'package:custom_zoomable_floorplan/core/models/location_model.dart';
import 'package:custom_zoomable_floorplan/core/models/models.dart';
import 'package:custom_zoomable_floorplan/core/viewmodels/floorplan_model.dart';
import 'package:custom_zoomable_floorplan/view/shared/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewWidgetA04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final model = Provider.of<FloorPlanModel>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //crossAxisSpacing: 2.0,
        //mainAxisSpacing: 20.0,
        crossAxisCount: 1,
      ),
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        int currentTile = index + 1;

        int locationTile = 1;
        List<Slot> tileSlots =
            model.slots.where((item) => item.tile == currentTile).toList();

        List<Location> titleLocation = model.locations
            .where((item) => item.tileLocation == locationTile)
            .toList();

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Global.blue,
              child: Image.asset('assets/images/floorMapA04.png'),
            ),
            Stack(
              children: List.generate(
                tileSlots.length,
                (idx) {
                  return Transform.translate(
                    offset: Offset(
                      size.width * tileSlots[idx].position[0],
                      size.width * tileSlots[idx].position[1],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: tileSlots[idx].status
                              ? Colors.red
                              : Colors.greenAccent,
                          radius: 5.0,
                          child: Center(
                            child: Icon(
                              Icons.pin_drop,
                              color: Global.blue,
                              size: 7,
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()..translate(18.0),
                          child: Text(
                            tileSlots[idx].name,
                            style: TextStyle(
                              fontSize: 6.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Stack(
              children: List.generate(
                titleLocation.length,
                (idx) {
                  return Transform.translate(
                    offset: Offset(
                      size.width * titleLocation[idx].positionLocation[0],
                      size.width * titleLocation[idx].positionLocation[1],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5.0,
                          child: Center(
                            child: Icon(
                              Icons.my_location_rounded,
                              color: Global.blue,
                              size: 7,
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()..translate(18.0),
                          child: Text(
                            titleLocation[idx].nameLocation,
                            style: TextStyle(
                              fontSize: 6.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
