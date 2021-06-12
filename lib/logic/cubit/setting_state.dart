part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final bool appNotification;
  final bool emailNotification;

  SettingState({
    @required this.appNotification,
    @required this.emailNotification,
  });

  @override
  List<Object> get props => [this.appNotification, this.emailNotification];

  SettingState copyWith({
    bool appNotification,
    bool emailNotification,
  }) {
    return SettingState(
      appNotification: appNotification ?? this.appNotification,
      emailNotification: emailNotification ?? this.emailNotification,
    );
  }

  @override
  String toString() =>
      'SettingState(appNotification: $appNotification, emailNotification: $emailNotification)';
}
