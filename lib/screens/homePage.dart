import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_cubit/counter_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Cubit Example"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, state) {
            // Determine the counter value based on the current state
            late int count;
            if (state is CounterInitial) {
              count = state.count;
            } else if (state is CounterUpdated) {
              count = state.count;
            } else if (state is CounterCleared) {
              count = state.count;
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Counter Display
                  Text(
                    count.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 35),

                  // Increment and Decrement Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Icon(Icons.add, size: 40, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 35),
                      InkWell(
                        onTap: () {
                          context.read<CounterCubit>().decrement();
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Icon(Icons.remove, size: 40, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),

                  // Clear Button
                  InkWell(
                    onTap: () {
                      context.read<CounterCubit>().clear();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Clear",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Navigation to Second Page
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        "/secondPage",
                        arguments: context.read<CounterCubit>(),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Second Page",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
