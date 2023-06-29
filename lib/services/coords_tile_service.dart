import 'dart:math';

import 'package:flutter/material.dart';

class CoordsTileService {
  Offset countTileXY(double latitude, double longitude, double zoom) {
    double latRad = latitude * pi / 180;
    double n = pow(2, zoom) as double;
    double xTile = ((longitude + 180) / 360 * n).floorToDouble();
    double yTile =
        ((1 - log(tan(latRad) + 1 / cos(latRad)) / pi) / 2 * n).floorToDouble();

    return Offset(xTile, yTile);
  }
}
