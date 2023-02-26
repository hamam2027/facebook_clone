import 'package:flutter/material.dart';
import 'package:flutter_application_2/componant/constant.dart';
import 'package:flutter_application_2/controller/screencontroller/marketcontroller.dart';
import 'package:get/get.dart';

class Market extends StatelessWidget {
  Market({super.key});
  MarketController controller = Get.put(MarketController());

  @override
  Widget build(BuildContext context) {
    // controller.getcategory();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Marketplace",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    await controller.getproducts();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Icon(Icons.edit_square), Text("Sell")],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit_square),
                      Text("Categories")
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Expanded(
            child: GetBuilder<MarketController>(builder: (controller) {
              if (controller.list.isEmpty) {
                controller.getproducts();
              }

              return controller.list.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: categ.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  categ[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close)),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("See All"))
                                  ],
                                ),
                              ],
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 1 / 1.25,
                                        crossAxisCount: 2),
                                itemBuilder: (context, ind) =>
                                    controller.list.length > index
                                        ? Column(
                                            children: [
                                              Container(
                                                height: 200,
                                                width: 200,
                                                child: Image.network(
                                                  controller
                                                      .list[index]
                                                      .products![ind]
                                                      .thumbnail!,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      controller
                                                          .list[index]
                                                          .products![ind]
                                                          .title!,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${controller.list[index].products![ind].price}"
                                                      " \$ ",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        : Center(
                                            child: CircularProgressIndicator()))
                          ],
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
          )
        ],
      ),
    );
  }
}
