
import 'package:autoplusRyan/ryan/utils/dummy_data.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {

    /// -- User Controllers
    Get.put(UserController());
    Get.put(AddressController());
  }
}
