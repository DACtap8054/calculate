import 'package:calculate/srceen/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class REGISTERSCREEN extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<REGISTERSCREEN> createState() => _REGISTERSCREENState();
}


class _REGISTERSCREENState extends State<REGISTERSCREEN> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool  _validateEmail = false;

  void _register() async {
  try {
    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(emailController.text)) {
      print('รูปแบบอีเมลไม่ถูกต้อง');
      return;
    }

    UserCredential userCredential = await widget._auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      _validateEmail = false;
    });

    // เก็บข้อมูลผู้ใช้เพิ่มเติมใน Firestore
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': emailController.text,
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      // เพิ่มฟิลด์เพิ่มเติมตามต้องการ
    });

    // พิมพ์อีเมลของผู้ใช้ที่ลงทะเบียน
    print('User registered: ${userCredential.user!.email}');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LOADINGSCREEN()),
    );
  } catch (e) {
    print('การลงทะเบียนล้มเหลว: $e');
  }

      // ถ้าการลงทะเบียนเป็นที่เรียบร้อย คุณสามารถดำเนินการเพิ่มเติมได้ที่นี่
      // ตัวอย่างเช่น บันทึกข้อมูลผู้ใช้ไปที่ Firestore หรือฐานข้อมูลอื่น ๆ
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 0,
              left: 2,
              child: Image.asset(
                'assets/images/5.png',
                width: 370,
                height: 130,
              ),
            ),
            Positioned(
              top: 0,
              left: 170,
              child: Image.asset(
                'assets/images/Group-9.png',
                width: 55,
                height: 130,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Group-7.png',
              fit: BoxFit.cover,
              width: 160,
              height: 188,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'กรอกอีเมลของคุณ',
                border: OutlineInputBorder(),
                //errorText: _validateEmail ? 'รูปแบบอีเมลไม่ถูกต้อง' : null,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'กรอกรหัสผ่านของคุณ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'ชื่อ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'นามสกุล',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _register,
              child: Text(
                'ลงทะเบียน',
                style: TextStyle(
                  fontFamily: 'Kanit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

