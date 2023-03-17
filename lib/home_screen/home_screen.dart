import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/home_screen/bloc/home_page_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: state.textColor,
          title: Text('Home Screen',
              style: TextStyle(
                color: state.color,
              )),
        ),
        body: InkWell(
          onTap: () {
            context
                .read<HomePageBloc>()
                .add(ChangeColorEvent(joke: state.joke));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            color: state.color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Hello There',
                    style: TextStyle(color: state.textColor),
                  ),
                ),
                Center(
                  child: Text(
                    'Tap anywhere to change the color',
                    style: TextStyle(color: state.textColor),
                  ),
                ),
                // button to generate a joke
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: state.textColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      context.read<HomePageBloc>().add(ChangeTextEvent());
                    },
                    child: Text(
                      'Tell me a Joke',
                      style: TextStyle(color: state.color),
                    ),
                  ),
                ),
                // display the joke
                state is JokeLoading
                    ? const CircularProgressIndicator()
                    : Container(
                        margin: const EdgeInsets.all(20),
                        child: Text(
                          state.joke,
                          style: TextStyle(color: state.textColor),
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
