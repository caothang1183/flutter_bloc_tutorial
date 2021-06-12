import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/setting_cubit.dart';
import 'package:flutter_bloc_tutorial/router/app_router.dart';
import 'package:flutter_bloc_tutorial/utility/app_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  runApp(App(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class App extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const App({
    Key key,
    @required this.appRouter,
    @required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter BLoC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
