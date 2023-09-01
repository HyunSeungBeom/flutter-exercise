import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
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
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
        title: Text('Flexible Space Title'),
        // background: Image.network(
        //   'https://example.com/your_image.jpg',
        //   fit: BoxFit.cover,
        // ),
        background: Image.asset(
          'assets/images/cat.jpeg',
          fit: BoxFit.cover,
        ));
  }
}
