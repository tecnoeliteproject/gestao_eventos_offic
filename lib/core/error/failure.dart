<<<<<<< HEAD
abstract class Failure {

  const Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}

class WriteFileFailure extends Failure {
  const WriteFileFailure({required String message}) : super(message);
}

class ReadDatabaseFailure extends Failure {
  const ReadDatabaseFailure({required String message}) : super(message);
}
=======
abstract class Failure {

  const Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}

class WriteFileFailure extends Failure {
  const WriteFileFailure({required String message}) : super(message);
}

class ReadDatabaseFailure extends Failure {
  const ReadDatabaseFailure({required String message}) : super(message);
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
