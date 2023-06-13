part of 'host_bloc.dart';

@freezed
class HostEvent with _$HostEvent {
  factory HostEvent.getAllHosts() = GetAllHosts;
  factory HostEvent.getHostDetails(int? id) = GetHostDetails;
}
