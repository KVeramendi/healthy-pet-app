import 'package:flutter/foundation.dart';

import '../data/http/http.dart';
import 'either.dart';

enum Failure { notFound, unauthorized, network, unknown }

Either<Failure, dynamic> handleFailure(HttpFailure failure) {
  if (failure.statusCode != null) {
    switch (failure.statusCode) {
      case 401:
        return Either.left(Failure.unauthorized);
      case 500:
        return Either.left(Failure.unauthorized);
      default:
        return Either.left(Failure.unknown);
    }
  }
  if (failure.exception is NetworkException) {
    return Either.left(Failure.network);
  }
  return Either.left(Failure.unknown);
}

String failureMessage(Failure failure) {
  final message = {
    Failure.notFound: 'There is no data',
    Failure.unauthorized: 'It hasn\'t permissions',
    Failure.network: 'Network error',
    Failure.unknown: 'Unknown error',
  }[failure];
  debugPrint('⚠ Failure message: $message ⚠');
  return '$message';
}
