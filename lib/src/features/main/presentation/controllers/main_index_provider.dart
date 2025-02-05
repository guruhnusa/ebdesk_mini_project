import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_index_provider.g.dart';

@Riverpod(keepAlive: true)
class MainIndex extends _$MainIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
