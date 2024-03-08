import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_craft/core/widgets/input.dart';

void main() {
  testWidgets('AntInput renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextInputField(
            controller: TextEditingController(),
            placeholder: 'Enter text',
            labelText: 'Label',
            onChanged: (value) {}, // You can provide a mock function here
          ),
        ),
      ),
    );

    // Verify if the AntInput is rendered with the specified placeholder and label text.
    expect(find.text('Enter text'), findsOneWidget);
    expect(find.text('Label'), findsOneWidget);

    // You can add more test cases based on your specific requirements.
  });

  testWidgets('AntInput is enabled when disabled is false',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextInputField(
            controller: TextEditingController(),
            placeholder: 'Enter text',
            labelText: 'Label',
            disabled: false,
          ),
        ),
      ),
    );

    // Verify if the AntInput is enabled.
    expect(
      tester.widget<TextField>(find.byType(TextField)).enabled,
      true,
    );
  });

  testWidgets('AntInput calls onChanged callback when text is entered',
      (WidgetTester tester) async {
    // Mock function to check if onChanged is called.
    String? changedValue;
    void onChangedCallback(String value) {
      changedValue = value;
    }

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextInputField(
            controller: TextEditingController(),
            placeholder: 'Enter text',
            labelText: 'Label',
            disabled: false,
            onChanged: onChangedCallback,
          ),
        ),
      ),
    );

    // Trigger text input.
    await tester.enterText(find.byType(TextFormField), 'Test');

    // Verify if the onChanged callback is called with the correct value.
    expect(changedValue, 'Test');
  });

  testWidgets('AntInput renders "*" prefix with label when isRequired is true',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextInputField(
            controller: TextEditingController(),
            placeholder: 'Enter text',

            labelText: "Test Label",
            isRequired: true,
            // Other parameters...
          ),
        ),
      ),
    );

    // Verify if the AntInput renders "*" prefix with the label.
    expect(find.text('*'), findsOneWidget);
  });
}
