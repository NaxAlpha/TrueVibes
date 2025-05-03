import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:truevibes/models/project.dart';
import 'package:truevibes/models/project_adapter.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class StorageService {
  static const String _projectsBoxName = 'projects';
  late Box<Project> _projectsBox;
  final StreamController<List<Project>> _projectsStreamController = 
      StreamController<List<Project>>.broadcast();

  // Expose a stream of projects that UI can listen to
  Stream<List<Project>> get projectsStream => _projectsStreamController.stream;

  // Singleton pattern
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  
  StorageService._internal();

  // Initialize Hive and open the projects box
  Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();
    
    // Register the Project adapter
    Hive.registerAdapter(ProjectAdapter());
    
    // Open the projects box
    _projectsBox = await Hive.openBox<Project>(_projectsBoxName);
    
    // Initial broadcast of projects
    _broadcastProjects();
  }

  // Get all projects
  List<Project> getAllProjects() {
    return _projectsBox.values.toList();
  }

  // Add a new project
  Future<void> addProject(Project project) async {
    await _projectsBox.put(project.id, project);
    _broadcastProjects();
  }

  // Delete a project
  Future<void> deleteProject(String projectId) async {
    await _projectsBox.delete(projectId);
    _broadcastProjects();
    
    // Note: This doesn't delete the actual project files,
    // just removes it from our projects list
  }

  // Update a project
  Future<void> updateProject(Project project) async {
    await _projectsBox.put(project.id, project);
    _broadcastProjects();
  }

  // Get a project by ID
  Project? getProject(String projectId) {
    return _projectsBox.get(projectId);
  }

  // Broadcast current projects to all listeners
  void _broadcastProjects() {
    _projectsStreamController.add(getAllProjects());
  }

  // Get default projects directory
  Future<String> getDefaultProjectsDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    final projectsDir = Directory(path.join(directory.path, 'TrueVibes Projects'));
    
    // Create the directory if it doesn't exist
    if (!await projectsDir.exists()) {
      await projectsDir.create(recursive: true);
    }
    
    return projectsDir.path;
  }

  // Close resources when done
  void dispose() {
    _projectsStreamController.close();
    _projectsBox.close();
  }
}
