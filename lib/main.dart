import 'package:demo_state_management/api/firebase_api.dart';
import 'package:demo_state_management/bloc/color/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: MaterialApp(
        title: 'Demo State Management',
        home: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
                alignment: Alignment.center,
                color: state.color,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: state.isCheck,
                      onChanged: (value) {
                        context.read<ColorBloc>().add(ChangeColorEvent());
                      },
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ChangeColorEvent());
                        print('color will change');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
