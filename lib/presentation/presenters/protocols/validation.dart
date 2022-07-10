import 'package:flutter/widgets.dart';

abstract class Validation {
  String validate({
    @required String field,
    @required String value,
  });
}
