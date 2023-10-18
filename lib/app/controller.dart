import 'package:get/get.dart';
import 'package:translator/translator.dart';

class GogleTranslater extends GetxController {
  var choseValue = 'en'.obs;
  var string = 'Welcome to translate controller'.obs;
  final translator = GoogleTranslator();

  void onTextChange(String? value) {
    string.value = value.toString();
    choseValue.value = 'en';
  }

  Future<void> onLanguageChange(String? value) async {
    var translation = await translator.translate(string.value,
        from: choseValue.value, to: value.toString());
    string.value = translation.text;
    choseValue.value = value.toString();
  }
}
