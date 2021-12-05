import 'package:mobx/mobx.dart';

mixin StoreMixin on Store {
  List<ReactionDisposer> disposers = [];

  void addReaction(ReactionDisposer disposer) {
    disposers.add(disposer);
  }

  void dispose() {
    for (final d in disposers) {
      d();
    }
  }
}
