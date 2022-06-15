abstract class NewsState{}

class NewsInitialState extends NewsState{}

class NewsChangeIndex extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{
  final String error;

  NewsGetBusinessErrorState(this.error);

}
class NewsGetBusinessLoadingsState extends NewsState{}



class NewsGetSportSuccessState extends NewsState{}
class NewsGetSportErrorState extends NewsState{
  final String error;

  NewsGetSportErrorState(this.error);

}
class NewsGetSportLoadingsState extends NewsState{}



class NewsGetScienceSuccessState extends NewsState{}
class NewsGetScienceErrorState extends NewsState{
  final String error;

  NewsGetScienceErrorState(this.error);

}
class NewsGetScienceLoadingsState extends NewsState{}



class NewsIsDarkModeState extends NewsState{}