import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'membre_controller.dart';

class Membres extends GetView<MembreController> {
  //
  Membres(){
    controller.getAllMembre();
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: controller.obx((state) {
        List membres = state!;
        return Column(
          children: [
            Container(
              height: 50,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                padding: EdgeInsets.all(30),
                children: List.generate(membres.length, (index) {
                  //
                  Map chantre = membres[index];
                  //
                  return ListTile(
                    onTap: (){
                      //
                      Get.dialog(Center(
                        child: Card(child: Container(
                          padding: EdgeInsets.all(10),
                          height: 300,
                          width: 300,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage("assets/4258310_91226-removebg-preview.png"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text("${chantre['noms']}", style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),),
                              ),
                              const SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.center,
                                child: Text("${chantre['voie']}", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15 ,
                                    color: Colors.blue.shade700,
                                ),),
                              ),
                              const SizedBox(height: 30,),
                              ElevatedButton(
                                onPressed: () {

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
                                      .all(Colors.red
                                      .shade700),
                                ),
                                child: Container(
                                  alignment:
                                  Alignment.center,
                                  width: double.maxFinite,
                                  child: const Text(
                                    "Supprimer",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),),
                      ));
                    },
                    leading: SvgPicture.asset(
                        "assets/PhUserDuotone.svg",
                        width: 50,
                        height: 50,
                        semanticsLabel: 'Acme Logo'
                    ),
                    title: Text("${chantre['noms']}", style: TextStyle(fontWeight: FontWeight.w900),),
                    subtitle: Text("${chantre['voie']}",style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold),),
                  );
                }),
              ),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //
          RxInt voix = 1.obs;
          //
          var box = GetStorage();
          List membres = box.read("membres") ?? [];
          //
          TextEditingController noms = TextEditingController();
          //
          Get.dialog(
            Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: Get.size.height / 1.2,
                  width: Get.size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage("assets/4258310_91226-removebg-preview.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Nouveau membre", style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),),
                        ),
                        const SizedBox(height: 20,),
                        TextField(
                          controller: noms,
                          decoration: InputDecoration(
                            hintText: "Nom complet",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                        const SizedBox(height: 20,),
                        DropdownButtonHideUnderline(
                          child: Obx(
                            () => DropdownButton(
                              isExpanded: true,
                              value: voix.value,
                              //
                              items: [
                                DropdownMenuItem(
                                  child: Text("Soprane"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Ténor"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("Alto"),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text("Bariton"),
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Text("Base"),
                                  value: 5,
                                ),
                              ],
                              onChanged: (e){
                                voix.value = e as int;
                              }
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            if(noms.text.isEmpty){
                              Get.snackbar("Oups", "Le champ est vide");
                            }else {
                              //
                              Map m = {
                                "noms":noms.text,
                                "voie": ["Soprane","Ténor","Alto","Bariton","Base"][voix.value - 1],
                              };
                              //
                              Get.back();
                              membres.add(m);
                              box.write("membres", membres);
                              controller.getAllMembre();
                              Get.snackbar("Succès", "Enregistrement éffectué avec succès");
                            }
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
                              "Enregistrer",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          );
        },
        backgroundColor: Colors.blue.shade700,
        child: SvgPicture.asset(
            "assets/SolarUserPlusRoundedLineDuotone.svg",
            semanticsLabel: 'Acme Logo',
            color: Colors.white,
        ),
      ),
    );
  }

}