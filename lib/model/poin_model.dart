class HistoryPointModel {
  final String title;
  final List<PoinModel> listPoin;

  HistoryPointModel({required this.title, required this.listPoin});
}

class PoinModel {
  final DateTime date;
  final int points;

  final List<String> _day = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  final List<String> _month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  PoinModel({required this.date, required this.points});

  String get dateToString {
    return '${_day.elementAt(date.weekday - 1)}, ${date.day}-${_month.elementAt(date.month - 1)}-${date.year}';
  }

  String get timeToString {
    return '${date.hour.toString().padLeft(2, "0")}.${date.minute.toString().padLeft(2, "0")}.${date.second.toString().padLeft(2, "0")} WIB';
  }
}

List<HistoryPointModel> listHistory = [
  HistoryPointModel(
    title: 'Masuk',
    listPoin: listMasuk,
  ),
  HistoryPointModel(
    title: 'Keluar',
    listPoin: listKeluar,
  ),
];

List<PoinModel> listMasuk = [
  PoinModel(date: DateTime(2023, 1, 1, 1, 11, 54), points: 10),
  PoinModel(date: DateTime(2023, 1, 2, 2, 12, 33), points: 10),
  PoinModel(date: DateTime(2023, 1, 3, 3, 9, 45), points: 10),
  PoinModel(date: DateTime(2023, 1, 4, 4, 3, 22), points: 10),
  PoinModel(date: DateTime(2023, 1, 5, 5, 6, 10), points: 10),
];

List<PoinModel> listKeluar = [
  PoinModel(date: DateTime(2023, 1, 1, 1, 1, 1), points: 10),
];
