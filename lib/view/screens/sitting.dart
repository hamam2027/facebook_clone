import 'package:flutter/material.dart';

class Sitting extends StatelessWidget {
  Sitting({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(15),
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 30),
                ),
                CircleAvatar(
                    backgroundColor: Colors.grey[350],
                    radius: 18,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 25,
                          color: Colors.black,
                        )))
              ],
            ),
            Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://alamphoto.com/wp-content/uploads/2021/03/%D8%A3%D8%AC%D9%85%D9%84-%D8%B5%D9%88%D8%B1-%D8%B4%D8%A8%D8%A7%D8%A8-2022.jpg"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "User Name",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Your shortcuts",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 95,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 60,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.network(
                                  "https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter"),
                            ),
                            const Positioned(
                              bottom: 0,
                              right: -15,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 16,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter"),
                                  radius: 13,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text("Flutter"),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            IconButton(onPressed: () {}, icon: icons[index]),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              items[index],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                itemCount: 12),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: Colors.grey[300],
              minWidth: double.infinity,
              onPressed: () {},
              child: const Text("See More"),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              height: 60,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black12)),
              minWidth: double.infinity,
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.handshake,
                    color: Color(0xffBCCFD9),
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Community resources"),
                  const Spacer(),
                  const Icon(Icons.arrow_circle_down_sharp),
                ],
              ),
            ),
            MaterialButton(
              height: 60,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black12)),
              minWidth: double.infinity,
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.help,
                    color: Color(0xffBCCFD9),
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Help & support"),
                  const Spacer(),
                  const Icon(Icons.arrow_circle_down_sharp),
                ],
              ),
            ),
            MaterialButton(
              height: 60,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black12)),
              minWidth: double.infinity,
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    color: Color(0xffBCCFD9),
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Settings & privacy"),
                  const Spacer(),
                  const Icon(Icons.arrow_circle_down_sharp),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: Colors.grey[300],
              minWidth: double.infinity,
              onPressed: () {},
              child: const Text("Log Out"),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  List<String> items = [
    "Feeds",
    "Friends",
    "Groups",
    "Marketplace",
    "Videos on Watch",
    "Memories",
    "Saved",
    "Pages",
    "Reels",
    "Events",
    "Gaming",
    "Stories",
  ];
  List<Icon> icons = [
    const Icon(Icons.home),
    const Icon(
      Icons.group,
      color: Colors.blue,
    ),
    const Icon(
      Icons.groups,
      color: Colors.blue,
    ),
    const Icon(
      Icons.storefront_sharp,
      color: Colors.blue,
    ),
    const Icon(
      Icons.tv_outlined,
      color: Colors.blue,
    ),
    const Icon(
      Icons.schedule_outlined,
      color: Colors.blue,
    ),
    const Icon(
      Icons.bookmark,
      color: Colors.blue,
    ),
    const Icon(
      Icons.flag,
      color: Colors.orange,
    ),
    const Icon(
      Icons.movie_filter_rounded,
      color: Colors.blue,
    ),
    const Icon(
      Icons.local_activity,
      color: Colors.red,
    ),
    const Icon(
      Icons.sports_esports_rounded,
      color: Colors.blue,
    ),
    const Icon(
      Icons.auto_stories,
      color: Colors.blue,
    ),
  ];
}
