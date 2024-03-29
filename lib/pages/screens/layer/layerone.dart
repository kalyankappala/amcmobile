import 'package:amcmobile/pages/screens/config.dart';
import 'package:flutter/material.dart';


class LayerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 654,
      decoration: BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0),
            topRight: Radius.circular(60.0),
            bottomLeft:Radius.circular(60.0) ,
            bottomRight: Radius.circular(60.0)
        ),
      ),
    );
  }
}