import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'toggle_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ToggleBloc(),
        child: ToggleScreen(),
      ),
    );
  }
}

class ToggleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: BlocListener<ToggleBloc, bool>(
        listener: (context, isOn) {
          if (isOn) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Light is ON!')),
            );
          }
        },
        child: BlocBuilder<ToggleBloc, bool>(
          builder: (context, isOn) {
            return Container(
              color: isOn ? Colors.yellow[100] : Colors.grey[800],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isOn ? 'Light is ON' : 'Light is OFF',
                      style: TextStyle(
                        fontSize: 24,
                        color: isOn ? Colors.black : Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print('Triggered');
                        context.read<ToggleBloc>().add(ToggleSwitchEvent());
                      },
                      child: Text(isOn ? 'Turn OFF' : 'Turn ON'),
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
