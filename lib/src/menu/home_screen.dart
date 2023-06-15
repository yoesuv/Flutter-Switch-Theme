import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/menu/show_dialog_exit.dart';
import 'package:flutter_switch_theme/src/my_app_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_event.dart';
import 'package:flutter_switch_theme/src/my_app_state.dart';
import 'package:flutter_switch_theme/src/widgets/my_app_textview.dart';

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
        title: const Text(
          'Switch Theme',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppTextView(
              'This application use Light/Dark theme',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, thickness: 1, color: Colors.teal),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyAppTextView(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16,
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
        inactiveTrackColor: Colors.grey[300],
        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: state.isDark,
        onChanged: (value) {
          _myAppBloc.add(MyAppThemeChangedEvent(isDark: value));
        },
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const ShowDialogExit();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'EXIT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
