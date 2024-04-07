class DateTimeHelper{
  static String dateToString(DateTime date){
    return '${date.day}/${date.month}';
  }

  static String dateToRecentTextDescription(DateTime date){
    if(date.day == DateTime.now().day && date.month == DateTime.now().month && date.year == DateTime.now().year){
      return 'Hoje';
    }

    if(date.day == DateTime.now().day - 1 && date.month == DateTime.now().month && date.year == DateTime.now().year){
      return 'Ontem';
    }

    return dateToString(date);
  }
}