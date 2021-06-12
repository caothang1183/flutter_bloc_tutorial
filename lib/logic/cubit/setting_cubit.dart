import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(SettingState(appNotification: false, emailNotification: false));

  void toggleAppNotification(bool value) {
    emit(state.copyWith(appNotification: value));
  }

  void toggleEmailNotification(bool value) {
    emit(state.copyWith(emailNotification: value));
  }
}
