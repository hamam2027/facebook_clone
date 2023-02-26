import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideoController extends GetxController {
  late VideoPlayerController cont;
  int wochindex = 0;
  @override
  void onInit() {
    cont = VideoPlayerController.network(
        "https://www.youtube.com/watch?v=T-e44iy-Vhg")
      ..initialize().then((value) {
        update();
      });
    super.onInit();
  }

  // plyvideo() {}

  // @override
  // ImagePicker picker = ImagePicker();

  // File? video;

  // Future<void> getpostimage() async {
  //   XFile? videos = await picker.pickVideo(source: ImageSource.camera);
  //   if (videos != null) {
  //     video = File(videos.path);
  //     cont = VideoPlayerController.file(video!)
  //       ..initialize().then((value) {
  //         update();
  //       });

  //     update();
  //   } else {
  //     update();
  //   }
  // }
}
