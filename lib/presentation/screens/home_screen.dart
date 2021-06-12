import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/constants/enums.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    "Wifi",
                    style: TextStyle(fontSize: 32, color: Colors.grey),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    "Mobile",
                    style: TextStyle(fontSize: 32, color: Colors.grey),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    "Disconnected",
                    style: TextStyle(fontSize: 32, color: Colors.grey),
                  );
                } else
                  return CircularProgressIndicator();
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Builder(
              builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                return Text("Counter: " + counterState.counterValue.toString());
              },
            ),
            Builder(
              builder: (context) {
                final internetState = context.watch<InternetCubit>().state;
                String internet;
                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  internet = "Wifi";
                  context.read<CounterCubit>().increment();
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  internet = "Mobile";
                  context.read<CounterCubit>().increment();
                } else {
                  internet = "Disconnected";
                  context.read<CounterCubit>().decrement();
                }
                return Text("Internet State: " + internet);
              },
            ),
            SizedBox(
              height: 24,
            ),
            Builder(
              builder: (context) {
                final counterValue = context
                    .select((CounterCubit cubit) => cubit.state.counterValue);
                return Text("Counter Value Change: " + counterValue.toString());
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  heroTag: "decrement",
                  tooltip: "decremented",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  heroTag: "increment",
                  tooltip: "incremented",
                  child: Icon(Icons.add),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/setting');
              },
              color: widget.color,
              child: Text("Go to Setting"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              color: widget.color,
              child: Text("Go to 2nd Screen"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              color: widget.color,
              child: Text("Go to 3rd Screen"),
            )
          ],
        ),
      ),
    );
  }
}
