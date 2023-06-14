import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_event.dart';
import 'package:flutter_switch_theme/src/my_app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late MyAppBloc _myAppBloc;

  @override
  void initState() {
    super.initState();
    _myAppBloc = context.read<MyAppBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Switch Theme',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This application use Light/Dark theme',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, thickness: 1, color: Colors.teal),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                _buildSwitch(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildButton(),
    );
  }

  Widget _buildSwitch() {
    return BlocBuilder<MyAppBloc, MyAppState>(
      bloc: _myAppBloc,
      buildWhen: (prev, current) => prev.isDark != current.isDark,
      builder: (context, state) => Switch(
        value: state.isDark,
        onChanged: (value) {
          _myAppBloc.add(MyAppThemeChangedEvent(isDark: value));
        },
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: ElevatedButton(
        child: Text(
          'EXIT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
