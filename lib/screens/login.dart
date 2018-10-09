import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _username, _url;

  @override
  void initState() {
    super.initState();
    _password = '';
    _username = '';
    _url = 'https://key.cat';
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      //_presenter.doLogin(_username, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.primaries[0],
    );
    var loginForm = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Login",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  controller: TextEditingController(text: this._url),
                  onSaved: (val) {
                    this._url = val;
                  },
                  validator: (val) {
                    try {
                      var uri = Uri.parse(val);
                      if (uri.scheme != "https") {
                        return "URL has to have https scheme";
                      }
                      return null;
                    } catch (e) {
                      return "Invalid url $e";
                    }
                  },
                  decoration: new InputDecoration(labelText: "Server URL"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) {
                    this._username = val;
                  },
                  validator: (val) {
                    return val.length < 3
                        ? "Username must have atleast 3 chars"
                        : null;
                  },
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => this._password = val,
                  validator: (val) {
                    return val.length < 1 ? "Password cannot be empty" : null;
                  },
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              ),
            ],
          ),
        ),
        _isLoading ? new CircularProgressIndicator() : loginBtn
      ],
      //crossAxisAlignment: CrossAxisAlignment.center,
    );

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: const Text('Key cat')),
        body: loginForm);
  }
}
