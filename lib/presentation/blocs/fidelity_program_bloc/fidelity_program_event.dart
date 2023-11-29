part of 'fidelity_program_bloc.dart';

@freezed
class FidelityProgramEvent with _$FidelityProgramEvent {
  const factory FidelityProgramEvent.getMonthlyPoints() = GetMonthlyPoints;
  const factory FidelityProgramEvent.getTotalPoints() = GetTotalPoints;
}
