import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: MyFlexibleSpace(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFlexibleSpace extends StatelessWidget {
  const MyFlexibleSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
        title: const Text('Flexible Space Title'),
       
        background: Image.asset(
          'assets/images/cat.jpeg',
          fit: BoxFit.cover,
        ));
  }
}
