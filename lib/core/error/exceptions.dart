<<<<<<< HEAD
import 'dart:developer';

class GeneralException implements Exception{
  GeneralException({required this.message}){
    log('Excepção: $message');
  }

  final String message;
}

class ServerException implements Exception {}
=======
import 'dart:developer';

class GeneralException implements Exception{
  GeneralException({required this.message}){
    log('Excepção: $message');
  }

  final String message;
}

class ServerException implements Exception {}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
