import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/counter_provider.dart';
import 'providers/user_provider.dart';
import 'screens/counter_screen.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
        showSemanticsDebugger: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 18, color: Colors.blueGrey),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.blueGrey),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const RegisterScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/counter': (context) => const CounterScreen(),
        },
      ),
    ),
  );
}
