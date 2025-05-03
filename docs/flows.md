# TrueVibes User Flows

## Current User Flows

TrueVibes, as an AI-powered vibe coding platform, has progressed beyond the initial counter demo and now implements several user flows centered around project management and AI-assisted development:

### Project List Flow

1. **Application Launch**
   - User launches the TrueVibes application
   - App initializes the storage service and loads existing projects
   - App displays the Project List screen with all saved projects or an empty state if no projects exist
   - On desktop, the UI adapts to show a container with constrained width for better readability

2. **Creating a New Project**
   - User clicks the "CREATE NEW PROJECT" button
   - App displays a dialog with a text field for project name input
   - User enters a project name and clicks "CREATE"
   - App creates a new project in the default directory
   - Project list is updated to include the new project

3. **Opening an Existing Project**
   - User clicks the "OPEN EXISTING PROJECT" button
   - App displays a file picker dialog for the user to select a project directory
   - User selects a directory on their system
   - App adds the selected directory as a project in the project list
   - Project list updates to include the newly added project

4. **Viewing Project Details**
   - Project List displays each project with:
     - Project name
     - Directory path
     - Creation date
     - Actions (open/delete)

5. **Opening a Project**
   - User clicks the "OPEN PROJECT" button on a project card
   - App validates that the project directory exists
   - App will navigate to the project editor screen (not yet implemented)

6. **Deleting a Project**
   - User clicks the delete icon on a project card
   - App displays a confirmation dialog
   - If the user confirms, the app removes the project from storage
   - Project list updates to reflect the deletion

7. **Settings Access**
   - User clicks the settings icon in the app bar
   - App will navigate to the settings screen (not yet implemented)

### Responsive UI Flow

1. **Desktop View**
   - On wider screens, projects are displayed in a grid layout
   - Action buttons are displayed side by side
   - Content is constrained to a readable width

2. **Mobile View**
   - On narrow screens, projects are displayed in a list layout
   - Action buttons stack vertically for better touch targets
   - Content uses the full width of the screen
