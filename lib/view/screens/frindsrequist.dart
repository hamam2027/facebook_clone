import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/screencontroller/frindsrequistcontroller.dart';
import 'package:get/get.dart';

class FrindsRequist extends StatelessWidget {
  FrindsRequist({super.key});
  FriendsRequistController controller = Get.put(FriendsRequistController());

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Frinds",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      )),
                ),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  height: 30,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () async {
                    await controller.getusers();
                  },
                  child: const Text("Requests"),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  height: 30,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {},
                  child: const Text("Your Friends"),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
            Text(
              "People You May Know",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.user!.users!.length,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            width: devicesize.width * 0.25,
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqmo_9xD80HtbddXgEKuT3IF24RBpI5NLVpw&usqp=CAU"),
                              radius: 45,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.user!.users![index].firstName}"
                                  " ${controller.user!.users![index].lastName}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${controller.user!.users![index].age}"
                                  " mutual friends",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: MaterialButton(
                                        height: 40,
                                        color: const Color(0xff1D73E8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        onPressed: () {},
                                        child: const Text(
                                          "Add Friend",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MaterialButton(
                                        height: 40,
                                        color: Colors.grey[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        onPressed: () {},
                                        child: const Text("Remove"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
