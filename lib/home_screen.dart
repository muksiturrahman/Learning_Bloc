import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_boc/Cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet not Connected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return const Text("Connected!");
              } else if (state == InternetState.Lost) {
                return const Text("Not Connected!");
              } else {
                return const Text("Loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
