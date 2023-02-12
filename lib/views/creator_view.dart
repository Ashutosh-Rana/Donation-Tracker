import 'dart:convert';

import 'package:donation_app/views/donate_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../creator_module/controllers/creator_controller.dart';

class creator_screen extends StatelessWidget {
  creator_screen() {
    readJson();
  }
  ControllerClass controller = Get.put(ControllerClass());
  Future<void> readJson() async {
    final String respone =
        await rootBundle.loadString("assets/files/creators.json");
    final data = await json.decode(respone);
    // setState(() {
    //   _items = data["creators"];
    // });

    // _items = data["creators"];
    //print(_items.length);
    controller.items.value = data["creators"];
    //print(controller.items.value.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Icon(
                Icons.sports_martial_arts,
                size: 40,
              ),
              //Spacer(),
              Align(alignment: Alignment.center,
                child: Text(
                  "DONATE",
                  style: TextStyle(fontSize: 40,),
                ),
              ),
              //Spacer(),
              Icon(
                Icons.bubble_chart,
                size: 40,
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => controller.items.value.isNotEmpty
            ? Column(children: [
                const Text("Recommended Creators",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                        childAspectRatio: (2.2 / 2),
                      ),
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //color: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Obx(
                                    () => InkWell(
                                      // customBorder: RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(16),
                                      //   side: BorderSide(width: 4,color: Colors.red)
                                      // ),
                                      onTap: () {
                                        Get.to(() => Donate_Screen(controller
                                            .items.value[index]["userName"],controller.items.value[index]
                                            ["profileUrl"],controller.items.value[index]
                                            ["id"]));
                                      },
                                      child: Image.network(
                                        controller.items.value[index]
                                            ["profileUrl"],
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .45,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Obx(
                                            () => Text(
                                              controller.items.value[index]
                                                  ["userName"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Obx(
                                            () => Text(
                                              controller.items.value[index]
                                                  ["profession"],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    const Icon(CupertinoIcons.heart)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: controller.items.value.length,
                    ),
                  ),
                ),
              ])
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
