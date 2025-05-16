# Todo Application

A simple Flutter app for managing your daily tasks, using [Isar](https://isar.dev/) for local data storage.

## Features

- Add, edit, and delete todo items
- Mark tasks as completed or incomplete
- Persistent local storage with Isar database
- Clean architecture with separation of data and domain layers

## Project Structure

```
lib/
  data/
    models/
      isar_todo.dart      # Isar model for todos
    repository/
      isar_todo_repo.dart # Data repository for todos
  domain/
    models/
      todo.model.dart     # Domain model for todos
  main.dart               # App entry point
```

## Getting Started

1. **Install dependencies:**
   ```sh
   flutter pub get
   ```

2. **Generate Isar part files:**
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

## Code Generation

This project uses code generation for Isar models. If you modify any model annotated with `@collection`, re-run the build_runner command above.

## Dependencies

- [Flutter](https://flutter.dev/)
- [Isar](https://pub.dev/packages/isar)
- [isar_flutter_libs](https://pub.dev/packages/isar_flutter_libs)
- [build_runner](https://pub.dev/packages/build_runner)
- [isar_generator](https://pub.dev/packages/isar_generator)

## License

This project is licensed under the MIT License.