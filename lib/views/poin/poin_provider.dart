import 'package:flutter/material.dart';
import 'package:yukparkir/model/poin_model.dart';

class PoinProvider extends ChangeNotifier {
  List<HistoryPointModel> _historyPoint = listHistory;

  List<HistoryPointModel> get historyPoint => _historyPoint;
}
