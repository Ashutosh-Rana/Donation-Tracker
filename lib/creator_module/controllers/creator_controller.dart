import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerClass extends GetxController {
  var items = [].obs;
  List<String> list = <String>['Rs', '\$'].obs;
  var dropdownValue = '\$'.obs;
  setText(String screenvalue) => dropdownValue.value = screenvalue;
  //var amount=TextEditingController();
  var amount=''.obs;
}
