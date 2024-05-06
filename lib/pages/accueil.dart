import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'membres/membres.dart';

class Accueil extends StatelessWidget {

  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Obx(() => currentIndex.value == 0 ? Padding(
        padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Présence des Anges", style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),),
              ),
              const SizedBox(height: 10,),
              Expanded(
                flex: 7,//4258310_91226.svg
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/4258310_91226-removebg-preview.png"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                /*
                  child: SvgPicture.asset(
                    "assets/4258310_91226.svg",
                    semanticsLabel: 'Acme Logo'

                ),
                */
              ),
              ElevatedButton(
                onPressed: () {
                  //
                  //Get.back();
                },
                style: ButtonStyle(
                  fixedSize:
                  MaterialStateProperty
                      .all(
                    const Size(
                      double.maxFinite,
                      45,
                    ),
                  ),
                  shape:
                  MaterialStateProperty
                      .all(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius
                          .circular(20),
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty
                      .all(Colors.blue
                      .shade700),
                ),
                child: Container(
                  alignment:
                  Alignment.center,
                  width: double.maxFinite,
                  child: const Text(
                    "Presence",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  //
                  //Get.back();
                },
                style: ButtonStyle(
                  fixedSize:
                  MaterialStateProperty
                      .all(
                    const Size(
                      double.maxFinite,
                      45,
                    ),
                  ),
                  shape:
                  MaterialStateProperty
                      .all(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius
                          .circular(20),
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty
                      .all(Colors.green
                      .shade700),
                ),
                child: Container(
                  alignment:
                  Alignment.center,
                  width: double.maxFinite,
                  child: const Text(
                    "Rapports",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) : Membres(),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        onTap: (e){
          currentIndex.value = e;
        },
        currentIndex: currentIndex.value,
        selectedItemColor: Colors.blue.shade700,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w900,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/SolarNotificationUnreadLinesLineDuotone.svg",
                semanticsLabel: 'Acme Logo'
            ),
            label: "Presence"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  "assets/SolarUsersGroupRoundedLineDuotone.svg",
                  semanticsLabel: 'Acme Logo'
              ),
              label: "Membres"
          ),

        ],
      ),
      ),
    );
  }
}