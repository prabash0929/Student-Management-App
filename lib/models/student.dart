import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String id;
  String name;
  String studentId;
  String email;
  String course;
  int age;
  DateTime createdAt;

  Student({
    required this.id,
    required this.name,
    required this.studentId,
    required this.email,
    required this.course,
    required this.age,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'studentId': studentId,
      'email': email,
      'course': course,
      'age': age,
      'createdAt': createdAt,
    };
  }

  factory Student.fromMap(String id, Map<String, dynamic> map) {
    return Student(
      id: id,
      name: map['name'] ?? '',
      studentId: map['studentId'] ?? '',
      email: map['email'] ?? '',
      course: map['course'] ?? '',
      age: map['age'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}