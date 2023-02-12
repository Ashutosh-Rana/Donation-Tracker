import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../creator_module/controllers/creator_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

String creator_name = "";
String profile_url = "";
String money="";
class Donate_Screen extends StatelessWidget {
  //const Donate_Screen({super.key});
  Donate_Screen(String name, String url) {
    creator_name = name;
    profile_url = url;
  }
  ControllerClass control = Get.put(ControllerClass());

  @override
  Widget build(BuildContext context) {
      print("${control.amount.value}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profile_url),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  creator_name,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Icon(
                CupertinoIcons.bubble_left,
                size: 30,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Send your love to ${creator_name} to Become a real fan",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * (.1),
                width: MediaQuery.of(context).size.width * (.95),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(children: [
                  Obx(
                    () => DropdownButton<String>(
                      value: control.dropdownValue.value,
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 35,
                        color: Colors.black,
                      ),
                      style: const TextStyle(color: Colors.black),
                      dropdownColor: Colors.yellow,
                      underline: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        control.setText(value!);
                        // setState(() {
                        //   dropdownValue = value!;
                        // });
                      },
                      items: control.list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "$value",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (.1),
                  ),
                  Flexible(
                      child: TextFormField(
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (value) {
                          control.amount.value=value;
                        },
                    decoration: InputDecoration(
                      hintText: "2000",
                    ),
                  )),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Your Name (optional)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: "Say something Nice (optional)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 45.0, horizontal: 10)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        //icon: const Icon(Icons.edit),
        backgroundColor: Color.fromARGB(255, 38, 9, 224),
        label: Obx(()=>
          Text(
            "Support ${control.dropdownValue.value} ${control.amount.value}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
