import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calculate/model.dart'; // Import UserModel class

class UserProfile extends StatefulWidget {
  final String email;

  UserProfile({required this.email});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<List<UserModel>> futureUserData; // Update the type of futureUserData

  @override
  void initState() {
    super.initState();
    futureUserData = fetchUserData(widget.email);
  }

  Future<List<UserModel>> fetchUserData(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      List<UserModel> userDataList = [];
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        UserModel user = UserModel.fromMap(data);
        userDataList.add(user);
      }
      return userDataList;
    } else {
      throw Exception('ไม่พบข้อมูลสำหรับอีเมลนี้');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: FutureBuilder(
        future: futureUserData,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('ไม่พบข้อมูลสำหรับอีเมลนี้');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (UserModel user in snapshot.data!)
                  Column(
                    children: [
                      Text('ชื่อ: ${user.name}'),
                      Text('อีเมล: ${user.email}'),
                      // เพิ่ม Widget อื่น ๆ ตามความต้องการ
                      SizedBox(height: 20),
                    ],
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
