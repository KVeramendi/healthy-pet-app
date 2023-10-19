import '../either.dart';
import '../entities/user.dart';
import '../failure.dart';

abstract class AuthenticationRepository {
  Future<User?> getUserData();
  Future<bool> get isLoggedIn;
  Future<Either<Failure, dynamic>> login(
    String email,
    String password,
  );
  Future<void> logout();
}
