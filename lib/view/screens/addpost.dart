import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/screencontroller/addpostcontroller.dart';
import 'package:flutter_application_2/controller/screencontroller/videocontroller.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});
  AddPostController controller = Get.put(AddPostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Create post",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          GetBuilder<AddPostController>(builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                    minWidth: 0,
                    color: controller.iconpost,
                    enableFeedback: true,
                    onPressed: () {},
                    child: const Text(
                      "POST",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            );
          }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hamam Gaber",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        children: [
                          MaterialButton(
                            height: 20,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lock_person_rounded,
                                  size: 15,
                                ),
                                Text(
                                  " Only me",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MaterialButton(
                            height: 20,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                                Text(
                                  " Album",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AddPostController>(builder: (controller) {
              return Expanded(
                  child: SingleChildScrollView(
                child: TextFormField(
                  onChanged: (val) {
                    controller.changiconpost(val);
                  },
                  maxLines: 300,
                  keyboardType: TextInputType.text,
                  keyboardAppearance: Brightness.light,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: controller.color,
                      border: InputBorder.none,
                      hintText: "whate is on your mine ?",
                      hintStyle: controller.color != Colors.white
                          ? const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )
                          : const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                ),
              ));
            }),
            GetBuilder<AddPostController>(builder: (controller) {
              if (controller.postimage != null) {
                return Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.file(controller.postimage!),
                      ),
                      IconButton(
                          onPressed: () {
                            controller.postimage = null;
                            controller.update();
                          },
                          icon: CircleAvatar(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
            // GetBuilder<AddPostController>(builder: (controller) {
            //   if (controller.video != null) {
            //     return Expanded(
            //       flex: 2,
            //       child: Stack(
            //         alignment: Alignment.topRight,
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: vid
            //           ),
            //           IconButton(
            //               onPressed: () {
            //                 controller.postimage = null;
            //                 controller.update();
            //               },
            //               icon: CircleAvatar(
            //                 child: Icon(
            //                   Icons.close,
            //                   color: Colors.white,
            //                 ),
            //               ))
            //         ],
            //       ),
            //     );
            //   } else {
            //     return Container();
            //   }
            // }),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.colors.length,
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    controller.changcolor(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.colors[index]),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      controller.getpostimage();
                    },
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.green,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sentiment_satisfied_alt_sharp,
                      color: Colors.orange,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30,
                    )),
                Container(
                  height: 30,
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
