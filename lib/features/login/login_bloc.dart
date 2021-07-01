import 'dart:async';

import 'package:base_bloc/bloc/event.dart';
import 'package:template_package/analytics/base_analytics.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends TemplateBloc {
  final StreamController _textDataState = StreamController<TextDataState>();

  LoginBloc(BaseAnalytics analytics) : super(analytics) {
    registerStreams([_textDataState.stream]);
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is LoginClickEvent) {
      _onLoginClick();
    }
  }

  void _onLoginClick() {
    _textDataState.add(TextDataState('Hey This is the data'));
  }

  @override
  dispose() {
    _textDataState.close();
    return super.dispose();
  }
}
