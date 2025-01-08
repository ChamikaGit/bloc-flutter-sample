import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/counter_cubit/counter_cubit.dart';

import '../bloc/counter/counter_bloc.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {

    final blocContext = ModalRoute.of(context)?.settings.arguments as BuildContext;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: container(blocContext),
      ),
    );
  }

  Widget container(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CounterCubit>(context),
      child: BlocBuilder<CounterCubit, CounterCubitState>(
        builder: (context, state) {

          late int count;
          if (state is CounterInitial) {
            count = state.count;
          } else if (state is CounterUpdated) {
            count = state.count;
          }
          return Center(
              child: Text(count.toString(), style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontWeight: FontWeight.bold))
          );
        },
      ),
    );
  }
}
