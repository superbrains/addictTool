import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageIndexNotifier extends StateNotifier<int> {
  PageIndexNotifier() : super(0);

  void setPageIndex(int index) {
    if (index < 0) {
      index = 0;
    } else if (index > 3) {
      index = 3;
    }
    state = index;
  }

  void analyticsTab() => setPageIndex(0);
}

final pageIndexProvider =
    StateNotifierProvider.autoDispose<PageIndexNotifier, int>(
        (ref) => PageIndexNotifier());
