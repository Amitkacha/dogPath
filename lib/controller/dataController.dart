import 'package:demo_dog_path/Model/apiDataModel.dart';
import 'package:get/state_manager.dart';

class DataController extends GetxController{
  var dataList = List<MyData>.empty(growable: true).obs;
}