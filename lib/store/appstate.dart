
class AppState {
	AuthState auth;

	AppState({
		this.auth
	});

}

class AuthState {
	bool working;
	bool loggedIn;

	AuthState({
		this.working = false,
		this.loggedIn = false
	});
}