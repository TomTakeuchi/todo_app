import 'package:flutter/cupertino.dart';

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
