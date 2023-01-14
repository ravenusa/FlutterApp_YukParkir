import 'package:flutter/material.dart';
import 'package:yukparkir/model/act_model.dart';

class ActProvider extends ChangeNotifier {
  List<HistoryActModel> _historyPoint = listHistory;

  List<HistoryActModel> get historyPoint => _historyPoint;
}
