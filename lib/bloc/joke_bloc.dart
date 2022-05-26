import 'package:bloc/bloc.dart';
import 'package:chucknorris/model/joke_model.dart';
import 'package:chucknorris/repository/joke_repository.dart';
import 'package:equatable/equatable.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<FetchAJoke>((event, emit) async {
      try {
        emit(JokeLoading());
        final joke = await apiRepository.fetchAJoke();
        emit(JokeLoaded(joke));
        if (joke.error != null) {
          emit(JokeError(joke.error));
        }
      } on NetworkError {
        emit(const JokeError('Failed to fetch data. is your device online?'));
      }
    });
  }
}
