import 'package:flutter/cupertino.dart';

extension ContextExtention on BuildContext{
  double get getHeight => MediaQuery.of(this).size.height;
  double get getWidth => MediaQuery.of(this).size.width;

}