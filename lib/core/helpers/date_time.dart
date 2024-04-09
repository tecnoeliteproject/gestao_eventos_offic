class DataTimeHelper {

  static String dataToText(DateTime date){
    var toDay = DateTime.now();
    if(date.year == toDay.year){
      if (date.month == toDay.month) {
        if (date.day == toDay.day) {
          return 'Hoje, ${date.hour}:${date.minute}';
        }
        return 'Há ${toDay.day - date.day} dias';
      }else{
        return 'Há ${toDay.month - date.month} meses';
      }
    }else{
      return 'Há ${toDay.year - date.year} anos';
    }
  }

  static String obterTempoDecorrido(DateTime data) {
    // Calcula a diferença entre a data atual e a data informada.
    Duration diferenca = DateTime.now().difference(data);

    // Converte a diferença para segundos.
    int segundos = diferenca.inSeconds;

    // Define as unidades de tempo.
    const Map<int, String> unidadesTempo = {
      60: "segundos",
      3600: "minutos",
      86400: "horas",
      2592000: "dias",
      31536000: "meses",
      315360000: "anos",
    };

    // Percorre as unidades de tempo e encontra a mais adequada.
    for (int divisor in unidadesTempo.keys) {
      if (segundos < divisor) {
        // Retorna o tempo decorrido na unidade de tempo mais adequada.
        return "${segundos ~/ divisor} ${unidadesTempo[divisor]} atrás";
      }
    }

    // A data informada é no futuro.
    return "no futuro";
  }
}
