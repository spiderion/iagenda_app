import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginPage extends BaseWidget {
  LoginPage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _text(),
        _loginButton(),
      ],
    ));
  }

  Widget _text() {
    return StreamBuilder(
        stream: bloc.getStreamOfType<TextDataState>(),
        builder: (BuildContext context, AsyncSnapshot<TextDataState> snapshot) {
          return Text(snapshot.data?.myData ?? '');
        });
  }

  Widget _loginButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                bloc.event.add(LoginClickEvent('login_click_event'));
              },
              child: Text(translate('login')),
            ),
          ],
        ),
      ),
    );
  }
}
