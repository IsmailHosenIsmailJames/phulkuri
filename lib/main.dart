import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phulkuri/auth/init.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.green),
          theme: ThemeData.light(),
          themeMode: themeProvider.themeMode,
          home: const InIt(),
        );
      },
    );
  }
}
