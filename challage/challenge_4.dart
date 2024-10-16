import 'dart:math';

class PointIndecator {
  final int _x;
  final int _y;

  const PointIndecator(this._x, this._y);

  int get x => _x;
  int get y => _y;

  PointIndecator translate(int dx, int dy) {
    return PointIndecator(_x + dx, _y + dy);
  }
}

class Shape {
  final PointIndecator leftBottom;
  final int width;
  final int height;

  Shape(this.leftBottom, this.width, this.height);

  PointIndecator get rightTop => leftBottom.translate(width, height);
}

class Distance {
  final double _centimeters;

  const Distance._(this._centimeters);

  const Distance.cms(double cms) : _centimeters = cms;
  const Distance.meters(double meters) : _centimeters = meters * 100;
  const Distance.kms(double kms) : _centimeters = kms * 100000;

  double get inCentimeters => _centimeters;
  double get inMeters => _centimeters / 100;
  double get inKilometers => _centimeters / 100000;

  Distance operator +(Distance other) {
    return Distance._(this._centimeters + other._centimeters);
  }

  @override
  String toString() {
    return 'Distance: ${_centimeters}cm';
  }
}

void main() {
  final leftBottomPoint = PointIndecator(2, 1);
  final shape = Shape(leftBottomPoint, 2, 4);

  final rightTopPoint = shape.rightTop;

  int dx = rightTopPoint.x - leftBottomPoint.x;
  int dy = rightTopPoint.y - leftBottomPoint.y;
  double distanceInCentimeters = sqrt(dx * dx + dy * dy) * 100;

  final distance = Distance.cms(distanceInCentimeters);

  print('Distance in centimeters: ${distance.inCentimeters}');
  print('Distance in meters: ${distance.inMeters}');
  print('Distance in kilometers: ${distance.inKilometers}');

  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);

  Distance totalDistance = d1 + d2;

  print('Total distance in kilometers: ${totalDistance.inKilometers}');
}
