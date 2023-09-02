import 'package:flutter_counter_example/providers/counter_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter test', () {
    test('value should start at 0', () {
      expect(CounterProvider().counter, 0);
    });

    test('value should be incremented', () {
      final counterProvider = CounterProvider();

      counterProvider.incrementCounter();
      expect(counterProvider.counter, 1);
    });

    test('value should be reload', () {
      final counterProvider = CounterProvider();

      counterProvider.reloadCounter();
      expect(counterProvider.counter, 0);
    });

    test('toggleImageWithDelay alternates the value and notifies listeners',
        () async {
      final counterProvider = CounterProvider();

      counterProvider.toggleImageWithDelay();
      expect(counterProvider.toglleImage, false);

      await Future.delayed(const Duration(milliseconds: 200));
      expect(counterProvider.toglleImage, true);
    });
  });
}
