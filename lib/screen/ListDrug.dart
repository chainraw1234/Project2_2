import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test5/constant.dart';

class ListDrug extends StatelessWidget {
  final String title;
  final String uid;

  const ListDrug({Key? key, required this.title, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance.collection('users').doc(globalUid).get(),
      
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // กำลังโหลดข้อมูล
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // เกิดข้อผิดพลาดในการโหลดข้อมูล
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // โหลดข้อมูลเสร็จสมบูรณ์
          final Map<String, dynamic>? userData = snapshot.data?.data();
          final String name = userData?['username'] ?? 'Unknown';
          final String hospital = userData?['hospital'] ?? 'Unknown';
          final String doctor = userData?['doctor'] ?? 'Unknown';
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[200],
              title: Text('รายการยา'),
            ),
            body: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 50,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Mr./Mrs. $name\nID : $uid", //ถ้ามีเวลามาแก้ Mr./Mrs.
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(10)),
                    constraints: BoxConstraints(
                      minHeight: 50, // กำหนดความสูงขั้นต่ำ
                    ),
                    width: MediaQuery.of(context).size.width, //ไห้ width 100%
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          "โรงพยาบาลที่จ่ายยา : $hospital\nชื่อแพทย์ที่จ่ายยา : $doctor",
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ใช้ FutureBuilder ในการดึงข้อมูลยาจาก Firebase Firestore
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: retrieveSubCol(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // กำลังโหลดข้อมูล
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // เกิดข้อผิดพลาดในการโหลดข้อมูล
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // โหลดข้อมูลเสร็จสมบูรณ์
                        List<Map<String, dynamic>> drugs = snapshot.data ?? [];
                        return Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 210, 243, 211),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minHeight: 500, // กำหนดความสูงขั้นต่ำ
                          ),
                          width: MediaQuery.of(context)
                              .size
                              .width, //ไห้ width 100%
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: DataTable(
                              dataTextStyle: TextStyle(fontSize: 18),
                              columns: [
                                DataColumn(
                                    label: Text('ชื่อยา',
                                        style: TextStyle(fontSize: 15))),
                                DataColumn(
                                    label: Text('สรรพคุณ',
                                        style: TextStyle(fontSize: 15))),
                                DataColumn(
                                    label: Text('จำนวน',
                                        style: TextStyle(fontSize: 15))),
                                DataColumn(
                                    label: Text('ราคา',
                                        style: TextStyle(fontSize: 15))),
                              ],
                              rows: drugs.map((drug) {
                                return DataRow(cells: [
                                  DataCell(
                                      Text(drug['Drug_Name'] ?? 'Unknown')),
                                  DataCell(
                                      Text(drug['Properties'] ?? 'Unknown')),
                                  DataCell(Text(drug['Quantity'] ?? 'Unknown')),
                                  DataCell(Text(drug['Price'] ?? 'Unknown')),
                                ]);
                              }).toList(),
                            ),
                          ),
                        );
                      }
                    },
                  ),SizedBox(height: 30,),
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // โค้ดสำหรับการยกเลิก
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            minimumSize: Size(150, 60),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // โค้ดสำหรับการสร้าง QR
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            minimumSize: Size(150, 60),
                          ),
                          child: Text(
                            'Generate QR',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 225, 246, 227),
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> retrieveSubCol() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(globalUid)
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
