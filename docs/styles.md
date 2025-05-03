# TrueVibes Style Guide

## Current Styling

The TrueVibes application implements a polished Material Design styling with attention to cross-platform usability:

### Color Scheme

- **Primary Color**: Deep Purple (`Colors.deepPurple`)
- **Color Scheme**: Generated from seed color using Material 3's color system
- **Theme Mode**: Light theme (with dark theme ready for implementation)
- **Button Colors**: Primary color for elevated buttons, outlined style for secondary actions
- **Card Colors**: Subtle background with appropriate elevation for depth

### Typography

- Uses the Material Design typography scale for consistency
- TitleLarge with bold weight for project names
- BodyMedium for directory paths with ellipsis overflow
- BodySmall for creation dates and secondary information
- Appropriate text sizing that scales with device settings

### Layout

- **Responsive Container**: Fixed width on large displays, full width on smaller screens
- **Adaptive Grid/List**: Grid layout for wide screens, list layout for narrow screens
- **Scaffold**: Material Design's `Scaffold` as the base layout structure
- **Constrained Sizing**: Width constraints for better readability on large displays
- **Flexible Buttons**: Stacked vertically on mobile, side-by-side on desktop
- **Padding and Spacing**: Consistent 16dp padding around content areas

### Components

- **AppBar**: Uses `inversePrimary` color with settings icon action
- **Cards**: Rounded corners (12dp radius) with appropriate elevation for project items
- **Buttons**:
  - Elevated buttons with icon for primary actions
  - Outlined buttons with icon for secondary actions
  - Consistent vertical padding (12-16dp) for touch targets
- **Dialogs**: Material Design alert dialogs for confirmations and inputs
- **Icons**: Material Icons for consistent visual language
  - Add icon for creating projects
  - Folder icon for opening projects
  - Delete icon for removing projects
- **Empty State**: Centered layout with descriptive text and prominent action buttons

## Planned Style Guide

For the future development of TrueVibes, the following style guidelines are recommended:

### Brand Colors

- **Primary Color**: Deep Purple (current) or a custom brand color
- **Secondary Color**: To be determined
- **Accent Color**: To be determined
- **Background Colors**: Light backgrounds with sufficient contrast for content
- **Text Colors**: Dark text on light backgrounds with proper contrast ratios

### Typography

- **Font Family**: Consider a custom font that matches the brand's personality
- **Type Scale**:
  - Display: For very large headlines
  - Headline: For section headers
  - Title: For content titles
  - Body: For main content
  - Caption: For supplementary information
- **Text Styles**: Consistent use of weight, size, and color throughout the app

### Spacing

- **Grid System**: 8dp grid for all spacing and dimensions
- **Padding**: Consistent padding for container elements
  - Small: 8dp
  - Medium: 16dp
  - Large: 24dp
- **Margins**: Consistent margins between sections
  - Standard: 16dp
  - Large: 32dp

### Components

- **Buttons**:
  - Primary: Filled buttons for main actions
  - Secondary: Outlined buttons for secondary actions
  - Tertiary: Text buttons for tertiary actions
- **Input Fields**: Consistent styling for text inputs, dropdowns, etc.
- **Cards**: For displaying content items, with consistent elevation and corners
- **Navigation**: Bottom navigation bar or drawer for main navigation
- **Lists**: Consistent styling for various list types

### Iconography

- Use Material Icons or a custom icon set
- Consistent sizing (24dp standard size)
- Consistent styling (outlined, filled, etc.)

### Imagery

- **User Avatars**: Circular, with consistent size
- **Content Images**: Rectangular with consistent corner radius
- **Empty States**: Illustrated empty states for sections without content

### Animation and Transitions

- Subtle animations for state changes
- Smooth transitions between screens
- Loading indicators for asynchronous operations

### Accessibility

- Color contrast ratios meeting WCAG standards
- Text scaling for different user preferences
- Touch targets of at least 48dp

### Dark Mode

- Support for both light and dark themes
- Proper color mapping between light and dark modes
- Reduced brightness while maintaining brand identity

### Responsive Design

- Adaptable layouts for different screen sizes
- Breakpoints for major form factors (phone, tablet, desktop)
- Consistent component sizing across devices
