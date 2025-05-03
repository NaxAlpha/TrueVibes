import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:truevibes/models/project.dart';
import 'package:truevibes/services/storage_service.dart';
import 'package:truevibes/widgets/project_list_item.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  final StorageService _storageService = StorageService();
  List<Project> _projects = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final projects = _storageService.getAllProjects();
    setState(() {
      _projects = projects;
    });
  }

  Future<void> _createNewProject() async {
    final nameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Project'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Project Name',
                hintText: 'Enter a name for your project',
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a project name')),
                );
                return;
              }
              
              // Get default directory
              final defaultDirectory = await _storageService.getDefaultProjectsDirectory();
              
              _saveNewProject(nameController.text, defaultDirectory);
              Navigator.pop(context);
            },
            child: const Text('CREATE'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveNewProject(String name, String directory) async {
    final project = Project(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      directory: directory,
      createdAt: DateTime.now(),
    );
    
    await _storageService.addProject(project);
    await _loadProjects();
  }

  Future<void> _openExistingProject() async {
    String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath != null) {
      // Check if a project.json or similar file exists to validate it's a valid project
      // For now, we'll just add it without validation
      final projectName = path.basename(directoryPath);
      
      final project = Project(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: projectName,
        directory: directoryPath,
        createdAt: DateTime.now(),
      );
      
      await _storageService.addProject(project);
      await _loadProjects();
    }
  }

  void _openProject(Project project) {
    // Check if directory exists
    final directory = Directory(project.directory);
    if (!directory.existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Directory not found: ${project.directory}')),
      );
      return;
    }
    
    // Navigate to project editor screen (not implemented yet)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening ${project.name}...')),
    );
    
    // TODO: Implement navigation to editor screen
  }

  void _deleteProject(Project project) async {
    await _storageService.deleteProject(project.id);
    await _loadProjects();
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${project.name} deleted')),
      );
    }
  }

  void _openSettings() {
    // Navigate to settings screen (not implemented yet)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings screen not implemented yet')),
    );
    
    // TODO: Implement navigation to settings screen
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWideScreen = size.width > size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrueVibes Projects'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
            tooltip: 'Settings',
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isWideScreen ? 600 : double.infinity,
          ),
          child: Column(
            children: [
              // Action buttons at the top - responsive layout for different screen sizes
              if (_projects.isNotEmpty) 
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // For very small screens, stack buttons vertically
                      if (!isWideScreen) {
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.add),
                                label: const Text('NEW PROJECT'),
                                onPressed: _createNewProject,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.folder_open),
                                label: const Text('OPEN EXISTING'),
                                onPressed: _openExistingProject,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        // For wider screens, use horizontal layout
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.add),
                                label: const Text('CREATE NEW PROJECT'),
                                onPressed: _createNewProject,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.folder_open),
                                label: const Text('OPEN EXISTING PROJECT'),
                                onPressed: _openExistingProject,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              
              // Main content
              Expanded(
                child: _projects.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.folder_open, size: 64, color: Colors.grey),
                            const SizedBox(height: 16),
                            Text(
                              'No Projects Yet',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            const Text('Create a new project or open an existing one'),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: 300, // Limit width for better desktop UX
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.add),
                                label: const Text('CREATE NEW PROJECT'),
                                onPressed: _createNewProject,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: 300, // Limit width for better desktop UX
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.folder_open),
                                label: const Text('OPEN EXISTING PROJECT'),
                                onPressed: _openExistingProject,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : _buildProjectList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Build the project list in a desktop-friendly way
  Widget _buildProjectList() {
    // For desktop, we'll use a more spacious layout with constraints
    return LayoutBuilder(
      builder: (context, constraints) {
        // For wider screens, use a grid layout
        if (constraints.maxWidth > 800) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5, // Wider than tall
              mainAxisExtent: 170, // Fixed height for each item
            ),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              final project = _projects[index];
              return ProjectListItem(
                project: project,
                onOpen: () => _openProject(project),
                onDelete: () => _deleteProject(project),
              );
            },
          );
        } else {
          // For narrower screens, use a list layout
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              final project = _projects[index];
              return ProjectListItem(
                project: project,
                onOpen: () => _openProject(project),
                onDelete: () => _deleteProject(project),
              );
            },
          );
        }
      },
    );
  }
}
