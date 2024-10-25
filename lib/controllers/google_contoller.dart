import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class GoogleController extends GetxController {
  var longitude = -122.085749655962;
  var latittude = 37.42796133580664;

  var address = "".obs;
  var pincode = "".obs;
  Position? position;
}
