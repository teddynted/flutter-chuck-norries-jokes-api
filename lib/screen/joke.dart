import 'package:chucknorris/bloc/joke_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chucknorris/widgets/loader.dart';
import 'package:chucknorris/widgets/joke_card.dart';

class Joke extends StatefulWidget {
  const Joke({Key? key}) : super(key: key);
  @override
  _JokeState createState() => _JokeState();
}

class _JokeState extends State<Joke> {
  final JokeBloc jokeBloc = JokeBloc();
  @override
  void initState() {
    jokeBloc.add(FetchAJoke());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      right: true,
      child: BlocProvider(
        create: (_) => jokeBloc,
        child: BlocListener<JokeBloc, JokeState>(
          listener: (context, state) {
            if (state is JokeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<JokeBloc, JokeState>(
            builder: (context, state) {
              if (state is JokeInitial) {
                return const Loader();
              } else if (state is JokeLoading) {
                return const Loader();
              } else if (state is JokeLoaded) {
                return JokeCard(
                  model: state.jokeModel,
                  bloc: jokeBloc,
                );
              } else if (state is JokeError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
