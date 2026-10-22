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

// Stateless: it only displays the title it receives through its constructor.
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
          const Divider(),
        ],
      );
}

// Stateless: it only draws the one Student passed in, and a different Student means the parent builds a new card.
class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) => Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounder card corners (16)
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primary, // Avatar uses the theme color with a larger radius
                foregroundColor: Colors.white,
                child: Text(student.name[0], style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(student.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Bold, larger TextStyle for the name
                    Text(student.course, style: TextStyle(color: Colors.grey.shade700)),
                    const SizedBox(height: 6),
                    InfoRow(icon: Icons.school, text: 'Year ${student.yearLevel}'),
                    InfoRow(icon: Icons.email, text: student.email),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

// Stateless: it only shows the icon and text it is given and holds nothing that can change.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoRow({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 6), // Small gap between icon and text
            Expanded(child: Text(text, style: const TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis)), // Expanded prevents overflow on long emails
          ],
        ),
      );
}