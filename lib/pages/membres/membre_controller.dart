import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MembreController extends GetxController with StateMixin<List> {
  //
  var box = GetStorage();
  //
  getAllMembre() async {
    List membres = box.read("membres") ?? [];
    change(membres, status: RxStatus.success());
  }
}