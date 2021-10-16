import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:person_info/feature/ui/home_screen_vm.dart';

final homeVmProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeScreenVm();
});
