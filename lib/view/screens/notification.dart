import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme con = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notifications",
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
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  New",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) => Container(
                    color: const Color(0xffE7F3FF),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://alamphoto.com/wp-content/uploads/2021/03/%D8%A3%D8%AC%D9%85%D9%84-%D8%B5%D9%88%D8%B1-%D8%B4%D8%A8%D8%A7%D8%A8-2022.jpg"),
                          radius: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                              ),
                              const Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form"),
                              Text(
                                "${DateTime.now().toLocal()}".substring(0, 16),
                                style: con.bodySmall,
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
