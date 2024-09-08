import 'package:flutter/material.dart';
import 'package:grid_staggered_lite/grid_staggered_lite.dart';

class Rooms extends StatelessWidget {
    Rooms({super.key});
    //make a   StaggeredTile list
    List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(2, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(2, 1),
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new StaggeredGridView.count(
        crossAxisCount: 2,
        staggeredTiles: _staggeredTiles,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        padding: const EdgeInsets.all(4),
        children: [
          Card(
            color: Colors.yellow,
            child: Center(child: Text("AB")),
          ),
          Card(
            color: Colors.green,
            child: Center(child: Text("CD ")),
          ),
          Card(
            color: Colors.blue,
            child: Center(child: Text("EF ")),
          ),
          Card(
            color: Colors.blue,
            child: Center(child: Text("GH ")),
          ),
          Card(
            color: Colors.blue,
            child: Center(child: Text("IJ ")),
          ),
          Card(
            color: Colors.blue,
            child: Center(child: Text("KL "
            )
            ),
          )]
        ,
      ),
    );
  }
}
