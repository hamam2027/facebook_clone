import 'package:flutter/material.dart';
import 'package:flutter_application_2/componant/componant.dart';
import 'package:flutter_application_2/controller/screencontroller/videocontroller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatelessWidget {
  Videos({super.key});
  VideoController contoller = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(builder: (controller) {
      return Container(
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    "Watch",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                  const Spacer(),
                  CircleAvatar(
                      backgroundColor: Colors.grey[350],
                      radius: 18,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.black,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey[350],
                      radius: 18,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: Colors.black,
                          )))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 40,
              child: ListView.builder(
                  itemCount: wochlist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        onTap: () {
                          controller.wochindex = index;
                          controller.update();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: controller.wochindex == index
                              ? BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15))
                              : const BoxDecoration(),
                          child: Text(
                            wochlist[index],
                            style: TextStyle(
                                color: controller.wochindex == index
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                        ),
                      )),
            ),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              onPressed: () {
                // controller.getpostimage();
              },
              child: const Icon(Icons.video_call_rounded),
            ),
            Container(
              height: 300,
              child: Center(
                child: contoller.cont.value.isInitialized
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            // contoller.cont.value.aspectRatio,
                            child: VideoPlayer(contoller.cont),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  controller.cont.setVolume(100000000);
                                  controller.update();
                                },
                                child: const Icon(Icons.volume_mute),
                              ),
                              const Spacer(),
                              FloatingActionButton(
                                onPressed: () {
                                  controller.cont.value.isPlaying
                                      ? controller.cont.pause().then((value) {
                                          controller.update();
                                        })
                                      : contoller.cont.play().then((value) {
                                          controller.update();
                                        });
                                },
                                child: Icon(
                                  controller.cont.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
 // Column(children: [
      //   
      // ]);