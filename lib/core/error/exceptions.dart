import 'dart:developer';

class GeneralException implements Exception{
  GeneralException({required this.message}){
    log('Excepção: $message');
  }

  final String message;
}

class ServerException implements Exception {}
