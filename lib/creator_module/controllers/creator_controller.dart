import 'package:get/get.dart';

class ControllerClass extends GetxController {
  var items = [].obs;
  List<String> list = <String>['Rs', '\$'].obs;
  var dropdownValue = '\$'.obs;
  setText(String screenvalue) => dropdownValue.value = screenvalue;
  //var amount=TextEditingController();
  var amount=''.obs;
  var donor_name=''.obs;
  var donor_msg=''.obs;
  var list_amount=[].obs;
  var list_name=[].obs;
  var list_message=[].obs;
  var list_cid=[].obs;
  var list_currency=[].obs;
}
