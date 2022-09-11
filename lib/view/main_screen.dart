import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nitflex/controller/home_scrren_controller.dart';

class MainScrren extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //appbar
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: const Text(
                "App Movie",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            // list move
            body:Obx(
              ()=> homeScreenController.loading.value==false? SizedBox(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: homeScreenController.homelistvideo.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            child: CachedNetworkImage(
                              imageUrl:
                                  homeScreenController.homelistvideo[index].poster!,
                              imageBuilder: ((context, imageProvider) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                      height: 170,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    ),
                              )),
                              placeholder: ((context, url) => const SpinKitRing(
                                    color: Colors.grey,
                                    size: 44,
                                  )),
                              errorWidget: ((context, url, error) => const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                    size: 50,
                                  )),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            SizedBox(width: Get.width/2.5,child: Text(homeScreenController.homelistvideo[index].title!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                            const SizedBox(height: 5,),
                            Text("year : ${homeScreenController.homelistvideo[index].years!}"),
                            SizedBox(width: Get.width/2.5,child: Text("Country : ${homeScreenController.homelistvideo[index].country!}",overflow: TextOverflow.ellipsis,maxLines: 2,)),
                            Text("imdb : ${homeScreenController.homelistvideo[index].imdb!}")
            
                          ],)
            
                        ],
                      );
                    })),
              ):const SpinKitCircle(color: Colors.black,size: 50,),
            )));
  }
}
