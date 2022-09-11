import 'package:get/get.dart';
import 'package:nitflex/models/homescrren_models.dart';
import 'package:nitflex/services/services.dart';

class HomeScreenController extends GetxController {
  RxList<HomeModels> homelistvideo = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    gethomitems();
    super.onInit();
  }

  gethomitems() async {
    loading.value = true;
    var responce = await DioSirvice()
        .gethome("https://moviesapi.ir/api/v1/movies?page=page");

    if(responce.statusCode==200){
       responce.data['data'].forEach((element) {
      homelistvideo.add(HomeModels.fromJson(element));
    });
    loading.value = false;

    }

   
  }
}
