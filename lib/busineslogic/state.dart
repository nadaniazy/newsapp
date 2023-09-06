abstract class NewsState{}
class InitialState extends NewsState{}
class getSuccessState extends NewsState{}
class getLoadingState extends NewsState{}
class getErrorState extends NewsState
{
  String? error;
  getErrorState(this.error);
}
class swapSuccessState extends NewsState{}
class clearSuccessState extends NewsState{}