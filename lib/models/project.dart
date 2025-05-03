import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

// Removing the part declaration since we're using a custom adapter
// part 'project.g.dart';

// Removing annotations since we're using a custom adapter
class Project {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String directory;

  @HiveField(3)
  final DateTime createdAt;

  Project({
    required this.id,
    required this.name,
    required this.directory,
    required this.createdAt,
  });

  // For displaying formatted date
  String get formattedDate => DateFormat('MMM dd, yyyy').format(createdAt);
  
  // Create a copy of this project with some fields replaced
  Project copyWith({
    String? id,
    String? name,
    String? directory,
    DateTime? createdAt,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      directory: directory ?? this.directory,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
