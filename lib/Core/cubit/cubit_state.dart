part of 'cubit_cubit.dart';

enum Status { intial, loggedin, logout }

class AuthflowState extends Equatable {
  const AuthflowState({required this.status});
  final Status status;
  @override
  List<Object> get props => [status];
}
