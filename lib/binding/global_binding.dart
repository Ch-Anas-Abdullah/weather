import 'package:get/get.dart';
import 'package:weather/controller/global_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => GlobalController());
  }
}
