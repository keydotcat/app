import 'appstate.dart';
import 'actions.dart';

AppState reducer(AppState state, action) {
	return AppState(
			auth: authReducer( state.auth, action )
	);
}

AuthState authReducer( AuthState state, action ){
	if (action == AuthLoginAction) {
		return AuthState(
				working: true,
				loggedIn: false
		);
	}
	return state;
}
