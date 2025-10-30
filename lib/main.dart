import 'package:flutter/material.dart';
import 'package:tokoroti_sqlite/screen/home_page.dart';
import 'screen/home_page.dart' hide HomeScreen;
import 'servis/db.servis.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Roti Yuyut',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}