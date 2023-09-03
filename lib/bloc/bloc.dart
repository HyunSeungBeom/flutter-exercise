import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './counterBloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(
                  'Count: $count',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    counterBloc.add(CounterEvent.increment);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    counterBloc.add(CounterEvent.decrement);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
