import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/album_provider.dart';
import 'view/album_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 1.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: ChangeNotifierProvider<AlbumProvider>(
  //       create: (context) => AlbumProvider(),
  //       child: const AlbumView(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumProvider>(
        create: (context) => AlbumProvider(),
        child: const AlbumView(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: [
  //       Provider<AlbumProvider>(
  //         create: (context) => AlbumProvider(),
  //       )
  //     ],
  //     builder: ((context, child) {
  //       return const MaterialApp(
  //         home: AlbumView(),
  //       );
  //     }),
  //   );
  // }
}
