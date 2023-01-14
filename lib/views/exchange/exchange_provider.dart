import 'package:flutter/material.dart';
import 'package:yukparkir/model/goods_model.dart';

class ExchangeProvider extends ChangeNotifier {
  final List<GoodsModel> _goodsModel = listOfGoods;

  List<GoodsModel> get goodsModel => _goodsModel;
}
