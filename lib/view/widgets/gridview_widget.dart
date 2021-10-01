import 'package:custom_zoomable_floorplan/core/models/models.dart';
import 'package:custom_zoomable_floorplan/core/viewmodels/floorplan_model.dart';
import 'package:custom_zoomable_floorplan/view/shared/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatelessWidget {
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
        List<Light> tileLights =
            model.lights.where((item) => item.tile == currentTile).toList();

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Global.blue,
              child: Image.asset('assets/images/floorPlan.png'),
            ),
            Stack(
              children: List.generate(
                tileLights.length,
                (idx) {
                  return Transform.translate(
                    offset: Offset(
                      size.width * tileLights[idx].position[0],
                      size.width * tileLights[idx].position[1],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: tileLights[idx].status
                              ? Colors.greenAccent
                              : Colors.white,
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
                            tileLights[idx].name,
                            style: TextStyle(
                              fontSize: 6.0,
                              color: Colors.white,
                            ),
                          ),
                        )
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
