import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/screencontroller/homecontroller.dart';
import 'package:flutter_application_2/controller/screencontroller/homepagecontroller.dart';
import 'package:flutter_application_2/view/screens/addpost.dart';
import 'package:get/get.dart';

class LatestNews extends StatelessWidget {
  LatestNews({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    if (controller.user == null) {
      controller.getusersdetails();
    }
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            shadowColor: Colors.grey,
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minWidth: 0,
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          print("object");
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Get.to(() => AddPost());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              "whats in your mind",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<HomeController>(builder: (controller) {
            return Container(
              child: controller.postsModel != null && controller.user != null
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey,
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .user!.users![index].firstName!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${DateTime.now().toLocal()}"
                                                .substring(0, 10),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.more_horiz_outlined))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    controller.postsModel!.posts![index].body!),
                                const SizedBox(
                                  height: 5,
                                ),
                                Image.network(
                                    "https://www.cairo24.com/UploadCache/libfiles/80/1/600x338o/812.jpg"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.sentiment_satisfied_alt_sharp,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.sentiment_dissatisfied_sharp,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        "${controller.user!.users![index].age!}"),
                                    Spacer(),
                                    Text(
                                        "${controller.postsModel!.posts![index].userId}"
                                        " commints"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Icon(Icons.thumb_up),
                                            Text("like")
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Icon(Icons.message),
                                            Text("comment")
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Icon(Icons.share),
                                            Text("share")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: controller.postsModel!.posts!.length,
                    )
                  : Container(
                      height: 400,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            );
          })
        ],
      ),
    );
  }
}
