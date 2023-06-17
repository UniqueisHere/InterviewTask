import 'package:get/get.dart';
import '../models/get_jokes_model.dart';

class GetAllJokesController extends GetxController {
  var getAllJokes = <JokesAPI>[].obs;

  void getJokes(List<JokesAPI> getJokes) {
    getAllJokes.value = getJokes;
  }
}

GetAllJokesController getJoke = Get.put(GetAllJokesController());
