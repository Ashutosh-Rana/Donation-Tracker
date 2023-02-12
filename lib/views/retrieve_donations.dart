import 'package:donation_app/views/creator_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../creator_module/controllers/creator_controller.dart';

ControllerClass control = Get.put(ControllerClass());

class MyDonation extends StatelessWidget {
  const MyDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Donations"),
      ),
      body: control.list_amount.value.length != 0
          ? SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromARGB(255, 231, 15, 227),
                        ),
                        height: MediaQuery.of(context).size.height * (.1),
                        child: ListTile(
                          leading: Text(
                            control.list_cid.value[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            '${control.list_name.value[index]}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '${control.list_currency.value[index]} ${control.list_amount.value[index]}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(control.list_message.value[index]),
                        ),
                      ),
                    );
                  },
                  itemCount: control.list_amount.value.length,
                ),
              ]),
            )
          : const Center(
              child: Text(
              "No any Donations done yet",
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 25, 189, 47)),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => creator_screen());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.home),
        tooltip: "Home",
      ),
    );
  }
}
