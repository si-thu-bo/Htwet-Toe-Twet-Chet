import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'navi_view_model.g.dart';

@riverpod
class NaviViewModel extends _$NaviViewModel {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index; 
  }
}
