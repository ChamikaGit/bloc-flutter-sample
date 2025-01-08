import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: content());
  }

  Widget content() {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.count.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print("CounterIncrement clicked");
                        /** to execute the bloc events **/
                        context.read<CounterBloc>().add(CounterIncrement());
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: const Icon(Icons.add, size: 40),
                      ),
                    ),
                    SizedBox(width: 35),
                    InkWell(
                      onTap: () {
                        print("CounterDecrement clicked");
                        /** to execute the bloc events **/
                        context.read<CounterBloc>().add(CounterDecrement());
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: const Icon(Icons.remove, size: 40),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                InkWell(
                  onTap: () {
                    print("Counter Clear clicked");
                    /** to execute the bloc events clear **/
                    context.read<CounterBloc>().add(CounterClear());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text("Clear",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 35),

                /** This section used to pass the context
                 * and get the same value to
                 * other screen using the same block instance.
                 */

                InkWell(
                  onTap: () {
                    print("Next Page Clicked");
                    Navigator.of(context).pushNamed("/secondPage",arguments: context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 120,
                    height: 80,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text("Second Page",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
