import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo_app/main.dart';

void main() {
  testWidgets('Add todos and enforce limit', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TodoApp());

    // Verify that there are no todos initially.
    expect(find.byType(ListTile), findsNothing);

    // Add three todos for the same day.
    _addTodoForCurrentDay(tester, 'Todo 1');
    _addTodoForCurrentDay(tester, 'Todo 2');
    _addTodoForCurrentDay(tester, 'Todo 3');

    // Try to add another todo for the same day.
    _addTodoForCurrentDay(tester, 'Todo 4');

    // Expect that the todo should not be added, and a message or alert indicating the limit has been reached should be shown.
    expect(find.byType(ListTile), findsNWidgets(3)); // Three todos should be added.
    expect(find.text('Todo 4'), findsNothing); // Todo 4 should not be added.

    // Add a todo for a different day.
    _addTodoForDay(tester, '2023-07-28', 'Todo 5');

    // Verify that the new todo is added and the limit is not enforced for a different day.
    expect(find.byType(ListTile), findsNWidgets(4));
    expect(find.text('Todo 5'), findsOneWidget);
  });
}

void _addTodoForCurrentDay(WidgetTester tester, String todoTitle) {
  // Simulate tapping the add button to add a todo for the current date.
  tester.tap(find.byIcon(Icons.add));
  tester.pumpAndSettle();

  // Enter the todo title in the alert dialog and confirm.
  tester.enterText(find.byType(TextField), todoTitle);
  tester.tap(find.text('ADD'));
  tester.pumpAndSettle();
}

void _addTodoForDay(WidgetTester tester, String date, String todoTitle) {
  // Simulate tapping the add button to add a todo for a specific date.
  tester.tap(find.byIcon(Icons.add));
  tester.pumpAndSettle();

  // Enter the date in the alert dialog and confirm.
  tester.enterText(find.byType(TextField), date);
  tester.tap(find.text('OK'));
  tester.pumpAndSettle();

  // Enter the todo title in the alert dialog and confirm.
  tester.enterText(find.byType(TextField), todoTitle);
  tester.tap(find.text('ADD'));
  tester.pumpAndSettle();
}
