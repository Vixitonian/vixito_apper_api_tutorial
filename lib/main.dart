import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixito_apper/providers/feed_provider.dart';
import 'package:vixito_apper/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FeedProvider())
    ], child: MaterialApp(home: HomeScreen()));
  }
}
