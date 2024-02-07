import 'package:flutter_riverpod/flutter_riverpod.dart';

final clockProvider = StreamProvider<DateTime>((ref) {
  return Stream<DateTime>.periodic(const Duration(seconds: 1), (_) {
    return DateTime.now();
  });
});
