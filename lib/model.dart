class UserModel {
  final String id;
  final String name;
  final String email;
  // เพิ่มฟิลด์อื่น ๆ ตามต้องการ

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    // กำหนดค่าเริ่มต้นให้กับฟิลด์อื่น ๆ ที่นี่
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['Email'],
      // แมปฟิลด์อื่น ๆ ที่นี่
    );
  }
}
