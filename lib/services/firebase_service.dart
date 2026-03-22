import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class FirebaseService {
  final CollectionReference _studentsCollection =
      FirebaseFirestore.instance.collection('students');

  // Create - Add new student
  Future<void> addStudent(Student student) async {
    try {
      await _studentsCollection.doc(student.id).set(student.toMap());
    } catch (e) {
      throw Exception('Failed to add student: $e');
    }
  }

  // Read - Get all students
  Stream<List<Student>> getStudents() {
    return _studentsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Update - Update student
  Future<void> updateStudent(Student student) async {
    try {
      await _studentsCollection.doc(student.id).update(student.toMap());
    } catch (e) {
      throw Exception('Failed to update student: $e');
    }
  }

  // Delete - Delete student
  Future<void> deleteStudent(String studentId) async {
    try {
      await _studentsCollection.doc(studentId).delete();
    } catch (e) {
      throw Exception('Failed to delete student: $e');
    }
  }

  // Get single student
  Future<Student?> getStudent(String studentId) async {
    try {
      DocumentSnapshot doc = await _studentsCollection.doc(studentId).get();
      if (doc.exists) {
        return Student.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get student: $e');
    }
  }
}