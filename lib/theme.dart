import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;
 
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // 라이트 모드 테마
      darkTheme: ThemeData.dark(), // 다크 모드 테마
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('테마 전환 예시'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeProvider.toggleTheme(); // 버튼을 누를 때 테마 모드 전환
          },
          child: Text('테마 전환'),
        ),
      ),
    );
  }
}
