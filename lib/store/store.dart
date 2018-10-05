import 'reducer.dart';
import 'appstate.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  return Store<AppState>(reducer, initialState: AppState());
}
