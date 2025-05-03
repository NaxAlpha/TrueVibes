import 'package:flutter/material.dart';
import 'package:truevibes/models/project.dart';

class ProjectListItem extends StatelessWidget {
  final Project project;
  final VoidCallback onOpen;
  final VoidCallback onDelete;

  const ProjectListItem({
    super.key,
    required this.project,
    required this.onOpen,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    project.name,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    // Show confirmation dialog before deleting
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Project'),
                        content: Text(
                            'Are you sure you want to delete "${project.name}"? This action cannot be undone.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('CANCEL'),
                          ),
                          TextButton(
                            onPressed: () {
                              onDelete();
                              Navigator.pop(context);
                            },
                            child: const Text('DELETE', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Directory: ${project.directory}',
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              'Created: ${project.formattedDate}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.folder_open),
                label: const Text('OPEN PROJECT'),
                onPressed: onOpen,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
