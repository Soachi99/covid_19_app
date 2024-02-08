// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginState {
  bool? firstValidation;

  LoginState({this.firstValidation = false});

  LoginState copyWith({
    bool? firstValidation,
  }) {
    return LoginState(
      firstValidation: firstValidation ?? this.firstValidation,
    );
  }
}
