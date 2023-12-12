import 'package:exercise/cubic/counter_cubic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(), 
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('Count: $state', style: TextStyle(fontSize: 24));
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => counterCubit.increment(),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () => counterCubit.decrement(),
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
