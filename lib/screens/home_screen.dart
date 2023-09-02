import 'package:flutter/material.dart';
import 'package:flutter_counter_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: counterProvider.toglleImage
                    ? Image.asset('assets/images/exercise1.png')
                    : Image.asset('assets/images/exercise2.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${counterProvider.counter}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () => counterProvider.reloadCounter(),
              tooltip: 'Reload',
              child: const Icon(Icons.refresh),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () => counterProvider.incrementCounter(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
