// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/screencontroller/homepagecontroller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    controller.getuserdata();
    return GetBuilder<HomePageController>(builder: (controller) {
      return DefaultTabController(
          length: 6,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              title: const Text(
                "facebook",
                style: TextStyle(
                    color: Color(
                      0xff1D73E8,
                    ),
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.messenger)),
              ],
              bottom: TabBar(
                onTap: (index) {
                  controller.update();
                },
                unselectedLabelColor: Colors.grey,
                labelColor: const Color(0xff1D73E8),
                tabs: [
                  const Tab(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.group,
                      size: 30,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.tv,
                      size: 30,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.storefront_outlined,
                      size: 30,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                    ),
                  ),
                  Tab(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(
                                "https://alamphoto.com/wp-content/uploads/2021/03/%D8%A3%D8%AC%D9%85%D9%84-%D8%B5%D9%88%D8%B1-%D8%B4%D8%A8%D8%A7%D8%A8-2022.jpg"),
                          ),
                        ),
                        CircleAvatar(
                          radius: 9,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 8,
                            child: Icon(
                              Icons.menu,
                              size: 15,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                    // icon: Icon(
                    //   Icons.menu,
                    //   size: 30,
                    // ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: controller.pages),
          ));
    });
  }
}
