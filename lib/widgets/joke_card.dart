import 'package:chucknorris/bloc/joke_bloc.dart';
import 'package:chucknorris/model/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:chucknorris/widgets/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chucknorris/helpers/palette.dart';

class JokeCard extends StatelessWidget {
  final JokeModel model;
  final JokeBloc bloc;
  const JokeCard({Key? key, required this.model, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Image(
                  width: 200,
                  image: AssetImage(
                      'assets/images/chucknorris_logo_coloured_small@2x.png'))),
          const FaIcon(FontAwesomeIcons.quoteLeft, color: Palette.flamingo),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    model.value.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Palette.mineShaft,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0),
                  ))),
          const FaIcon(FontAwesomeIcons.quoteRight, color: Palette.flamingo),
          Button(
            top: 30,
            text: 'Fetch More',
            primary: Palette.flamingo,
            color: Palette.white,
            onPressed: () => {bloc.add(FetchAJoke())},
            faIcon: const FaIcon(FontAwesomeIcons.cloudArrowDown,
                color: Palette.white),
            horizontal: 50,
            vertical: 10,
          ),
        ],
      ),
    );
  }
}
