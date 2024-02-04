part of 'fidelity_program_bloc.dart';

@freezed
class FidelityProgramState with _$FidelityProgramState {
  const factory FidelityProgramState({
    String? title,
    StateStatus? status,
    StateStatus? statusRange,
    String? monthlyPoints,
    String? totalPoints,
    String? totalPoints2,
    String? points,
    String? rank,
    List<String>? list,
    List<String>? listContent,
  }) = _FidelityProgramState;

  factory FidelityProgramState.initial() => const FidelityProgramState(
        title: "Home",
        status: StateStatus.init,
        statusRange: StateStatus.init,
        monthlyPoints: "0",
        totalPoints: "0",
        totalPoints2: "0",
        points: "0",
        rank: "0",
        list: [
          "Réservez et Gagner ",
          "Aventurier du mois",
          "Super Aventurier ",
        ],
        listContent: [
          "Gagner des récompenses à chaque niveau et à chaque mois",
          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        ],
      );
}
