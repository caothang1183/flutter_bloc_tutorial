import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/setting_cubit.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocListener<SettingCubit, SettingState>(
          listener: (context, state) {
            final notificationSnackBar = SnackBar(
              content: Text(
                'App: ' +
                    state.appNotification.toString().toUpperCase() +
                    ', Email: ' +
                    state.emailNotification.toString().toUpperCase(),
              ),
              duration: Duration(milliseconds: 700),
            );
            ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
          },
          child: BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  children: [
                    SwitchListTile(
                      value: state.appNotification,
                      onChanged: (value) {
                        context
                            .read<SettingCubit>()
                            .toggleAppNotification(value);
                      },
                      title: Text("App Notification"),
                    ),
                    SwitchListTile(
                      value: state.emailNotification,
                      onChanged: (value) {
                        context
                            .read<SettingCubit>()
                            .toggleEmailNotification(value);
                      },
                      title: Text("E-mail Notification"),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
