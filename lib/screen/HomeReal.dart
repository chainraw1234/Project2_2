import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test5/constant.dart';
import 'ListDrug.dart';
import 'package:test5/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomBody extends StatelessWidget {
  final String title;
  final String uid;

  CustomBody({Key? key, required this.title, required this.uid})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        //กล่อง
        decoration: BoxDecoration(
            color: Colors.green[200], borderRadius: BorderRadius.circular(10)),
        height: 250,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListDrug(title: title, uid: globalUid)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Nemo.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('ออกใบรับยา',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Nemo.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('จองคิวหมอ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Nemo.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('ใบรับรอง\nโตวิด 19',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5,top: 15,),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Nemo.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('ค้นหา\nหน่วยบริการ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Nemo.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('ผลตรวจ ATK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Petch.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('soon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Oak.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('soon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(children: [
                    Material(
                      color: Colors.purple,
                      elevation: 8,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 0.01),
                          ),
                          padding: EdgeInsets.all(
                              4), // เพิ่ม padding เพื่อให้รูปภาพมีพื้นที่ว่าง
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/screen/images/Shop.png'),
                            radius: 30, // กำหนดรัศมีของรูปภาพ
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8), // ระยะห่างระหว่าง Icon และ Text
                    Text('soon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> retrieveSubCol() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc('iUJFcncLDBf7Su6YfOtiTk2PA4H3')
        .collection("list-drug")
        .get();

    int count = querySnapshot.size;
    print("Total documents in subcollection: $count");

    List<Map<String, dynamic>> drugs = [];

    await Future.forEach(querySnapshot.docs, (doc) async {
      var data = (await doc.reference.get()).data();
      if (data != null) {
        print("Fetching data for ${doc.id}");
        var subcol = await doc.reference.get();
        if (subcol.exists) {
          Map<String, dynamic> drugData = {
            "Drug_Name": subcol["Drug_Name"],
            "Properties": subcol["Properties"],
            "Quantity": subcol["Quantity"],
            "Price": subcol["Price"],
          };
          drugs.add(drugData);
        }
      }
    });

    return drugs;
  }
}
// if(){
//   print("success");
// }

// FirebaseFirestore.instance
//     .collection("users")
//     .doc('iUJFcncLDBf7Su6YfOtiTk2PA4H3')
//     .collection("list-drug")
//     .doc("Drug B")
//     .get()
//     .then((subcol) {
//   if (subcol.exists) {
//     print(subcol["Drug_Name"]);
//   }
// });
