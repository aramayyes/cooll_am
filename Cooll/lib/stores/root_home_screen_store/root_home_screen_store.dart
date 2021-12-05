import 'package:mobx/mobx.dart';

part 'root_home_screen_store.g.dart';

class RootHomeScreenStore = RootHomeScreenStoreBase with _$RootHomeScreenStore;

abstract class RootHomeScreenStoreBase with Store {
  @observable
  int activeIndex = 0;

  @action
  void changeIndex(int newIndex) {
    activeIndex = newIndex;
  }
}
