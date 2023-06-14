import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/menu/home_bloc.dart';
import 'package:flutter_switch_theme/src/menu/home_event.dart';
import 'package:flutter_switch_theme/src/menu/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
    _bloc.add(HomeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, thickness: 1, color: Colors.teal),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
        ),
        child: ElevatedButton(
          child: Text('EXIT'),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildSwitch() {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _bloc,
      buildWhen: (prev, current) => prev.isDarkMode != current.isDarkMode,
      builder: (context, state) => Switch(
        value: state.isDarkMode,
        onChanged: (value) {
          _bloc.add(HomeSwitchChangedEvent(value: value));
        },
      ),
    );
  }
}
