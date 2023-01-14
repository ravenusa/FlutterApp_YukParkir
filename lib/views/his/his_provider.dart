import 'package:flutter/material.dart';
import 'package:yukparkir/model/history_model.dart';

class hisProvider extends ChangeNotifier {
  List<HistoryActModel> _historyPoint = listHistory;

  List<HistoryActModel> get historyPoint => _historyPoint;
}
