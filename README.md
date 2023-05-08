# Flutter Render Object Demo

This is a simple Flutter application that demonstrates how to create a custom RenderObject using Flutter's rendering library.

## Getting Started

To get started with this project, you'll need to have the following:

- Flutter SDK installed on your machine
- A code editor (such as VS Code, IntelliJ IDEA, or Android Studio)

## Installation

1. Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/yourusername/custom-render-object-demo.git
```

2. Open the project in your code editor of choice.

3. Run the following command to install the project dependencies:

```dart
flutter pub get
```
4. Run the project using the following command:

```dart
flutter run
```

## Project Structure

The project has:


- `main.dart`: This file contains the main entry point for the application and sets up the MaterialApp widget.
- `custom_rect.dart`: This file contains the implementation of the `CustomRect` widget and the `CustomRenderObject` class.

## How it Works

The `CustomRect` widget is a simple Flutter widget that creates a new instance of the `CustomRenderObject` class and passes it a value property. The value property is used to determine the height of the blue rectangle that is drawn on the canvas.

The `CustomRenderObject` class is a custom RenderObject that is responsible for drawing the blue rectangle on the canvas. It is a leaf render object, which means that it has no children. The class extends the `RenderBox` class and overrides the `paint()` method to draw the rectangle on the canvas.

