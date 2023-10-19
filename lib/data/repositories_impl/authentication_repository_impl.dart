// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../../domain/either.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/failure.dart';
// import '../../domain/repositories/authentication_repository.dart';
// import '../datasources/remote/authentication_api.dart';

// const _id = 'id';
// const _token = 'token';
// const _user = 'user';
// const _inspectorId = 'inspectorId';
// const _inspector = 'inspector';
// const _company = 'company';

// class AuthenticationRepositoryImpl implements AuthenticationRepository {
//   // final FlutterSecureStorage _secureStorage;
//   // final AuthenticationApi _authenticationApi;
//   AuthenticationRepositoryImpl(
//       // this._secureStorage,
//       // this._authenticationApi,
//       );

//   @override
//   Future<User?> getUserData() {
//     // TODO: implement getUserData
//     return Future.value(User());
//   }

//   @override
//   Future<bool> get isLoggedIn async {
//     // final sessionId = await _secureStorage.read(key: _token);
//     // return sessionId != null;
//     return true;
//   }

//   @override
//   Future<Either<Failure, dynamic>> login(
//     String email,
//     String password,
//     String userType,
//   ) async {
//     // final requestToken = await _authenticationApi.createRequestToken(
//     //   email,
//     //   password,
//     //   userType,
//     // );
//     // return requestToken.when((failure) {
//     //   return Either.left(failure);
//     // }, (response) async {
//       // await _secureStorage.write(
//       //     key: _id, value: response['id_usuario'].toString());
//       // await _secureStorage.write(key: _user, value: response['primer_nom']);
//       // await _secureStorage.write(
//       //   key: _inspectorId,
//       //   value: response['id_inspector'].toString(),
//       // );
//       // await _secureStorage.write(
//       //   key: _inspector,
//       //   value:
//       //       '${response['nombres']} ${response['apellido_paterno']} ${response['apellido_materno']}',
//       // );
//       // await _secureStorage.write(key: _token, value: response['token']);
//       // await _secureStorage.write(
//       //     key: _company, value: response['empresa']['id_empresa'].toString());
//       // return Either.right(response);
//       return Either.right('response');
//     // });
//   }

//   @override
//   Future<void> logout() {
//     return _secureStorage.delete(key: _token);
//   }
// }
