import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie List',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: CrudApp());
  }
}
