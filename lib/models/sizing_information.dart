import 'package:flutter/widgets.dart';
import 'package:passwd/models/device_type.dart';

class SizingInformation {
  final DeviceType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });
}
