part of 'user_cubit.dart';

class UserState extends Equatable {
  final String error;
  final UserModel userModel;

  const UserState({required this.userModel, required this.error,});

  UserState copyWith({
    String? error,
    UserModel? userModel,
  }) {
    return UserState(
        userModel: userModel ?? this.userModel,
        error: error ?? this.error,
      );
  }


  @override
  List<Object?> get props => [error, userModel];

}

