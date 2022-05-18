// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:incredux/constants/strings.dart';
import 'package:incredux/logic/actions.dart';
import 'package:incredux/logic/reducer.dart';
import 'package:incredux/logic/state.dart';
import 'package:incredux/view/screen/screen1.dart';
import 'package:incredux/view/screen/screen2.dart';
import 'package:redux/redux.dart';

import 'package:incredux/main.dart';

void main() {
  test('Reducer Increment/Decrement Actions', () {
    // Initlize Store with our AppState
    Store<AppState> appstate =
        Store<AppState>(counterReducer, initialState: AppState(counter: 0));

    // Verify Counter start at 0
    expect(appstate.state.counter, 0);

    // Triger the Increment Action
    appstate.dispatch(Increment());

    // Verify Counter updated to 1
    expect(appstate.state.counter, 1);

    // Triger the Decrement Action
    appstate.dispatch(Decrement());

    // Verify Counter updated to 0
    expect(appstate.state.counter, 0);
  });

  group('App functionallity', () {
    testWidgets('''Screen1 Counter test''', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(StoreProvider(
        store:
            Store<AppState>(counterReducer, initialState: AppState(counter: 0)),
        child: const MaterialApp(
          home: Screen1(),
        ),
      ));

      // Verify that our screen at Screen1.
      expect(find.text(user1), findsOneWidget);
      expect(find.text(user2), findsNothing);

      // Verify Counter start at 0
      expect(find.text('0'), findsOneWidget);

      // Triger the increment button
      await tester.tap(find.byTooltip('Increment'));
      await tester.pump();

      // Verify the counter updated to 1
      expect(find.text('1'), findsOneWidget);

      // Triger the decrement button
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pump();

      // Verify the counter updated to 0
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('''Screen2 Counter test''', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(StoreProvider(
        store:
            Store<AppState>(counterReducer, initialState: AppState(counter: 0)),
        child: const MaterialApp(
          home: Screen2(),
        ),
      ));

      // Verify that our screen at Screen2.
      expect(find.text(user2), findsOneWidget);
      expect(find.text(user1), findsNothing);

      // Verify Counter start at 0
      expect(find.text('0'), findsOneWidget);

      // Triger the increment button
      await tester.tap(find.byTooltip('Increment'));
      await tester.pump();

      // Verify the counter updated to 1
      expect(find.text('1'), findsOneWidget);

      // Triger the decrement button
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pump();
      
      // Verify the counter updated to 0
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Counter Increment in Screen1 and Decrement in Screen2', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ReduxApp());

      // Verify that our screen at Home Page.
      expect(find.text(user1), findsOneWidget);
      expect(find.text(user2), findsOneWidget);
      
      // Triger the Screen1 Navigation Button
      await tester.tap(find.text(user1));
      await tester.pumpAndSettle();

      // Verify that our screen at Screen1.
      expect(find.text(user1), findsOneWidget);
      expect(find.text(user2), findsNothing);

      // Verify Counter start at 0
      expect(find.text('0'), findsOneWidget);

      // Triger the increment button
      await tester.tap(find.byTooltip('Increment'));
      await tester.pump();

      // Verify the counter updated to 1
      expect(find.text('1'), findsOneWidget);

      // Go back to Home Page
      await tester.pageBack();
      await tester.pumpAndSettle();

      // Triger the Screen2 Navigation Button
      await tester.tap(find.text(user2));
      await tester.pumpAndSettle();

      // Verify that our screen at Screen2.
      expect(find.text(user2), findsOneWidget);
      expect(find.text(user1), findsNothing);

      // Verify Counter start at 1
      expect(find.text('1'), findsOneWidget);

      // Triger the decrement button
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pump();

      // Verify the counter updated to 0
      expect(find.text('0'), findsOneWidget);
    });
  });
}
