import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class imagepicker extends GetxController {
  RxString imagepath = ''.obs;
  RxString storedValue = ''.obs;
  getimage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Store data
      prefs.setString('image', image.path.toString());
      imagepath.value = image.path.toString();

      // Retrieve data
      storedValue.value = await prefs.getString('image') ?? 'fazal';

      print('added shsre');
    }
  }
}
