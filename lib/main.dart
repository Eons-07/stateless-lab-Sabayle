import 'package:flutter/material.dart';

// Plain data class: all fields are final and the constructor is const, so every Student is immutable.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;
  const Student({required this.name, required this.course, required this.yearLevel, required this.email});
}

const List<Student> students = [
  Student(name: 'Leojnn Sabayle', course: 'BS Information Technology', yearLevel: 2, email: 'leojnn.sabayle@school.edu'),
  Student(name: 'Jesu Sabayle', course: 'BS Computer Science', yearLevel: 3, email: 'jesu.sabayle@school.edu'),
  Student(name: 'Ken De Ocampo', course: 'BS Information Systems', yearLevel: 1, email: 'ken.deocampo@school.edu'),
  Student(name: 'Kaiser Lim', course: 'BS Computer Engineering', yearLevel: 4, email: 'kaiser.lim@school.edu'),
  Student(name: 'Agatha De Ocampo', course: 'BS Information Technology', yearLevel: 3, email: 'agatha.deocampo@school.edu'),
];