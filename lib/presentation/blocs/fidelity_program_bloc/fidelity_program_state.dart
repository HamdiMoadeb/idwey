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
          "Devenez l'aventurier du mois en accumulant le plus de points !",
          "À chaque niveau, une surprise vous attend ! Dès que vous atteignez votre objectif, une récompense vous est offerte.",
        ],
      );
}
