import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/order_model.dart';

class ChangeStatus extends ChangeNotifier {

  changestatus(int id) async {
    final response =
    await http.post(Uri.parse('http://barbarossa-restaurant.herokuapp.com/api/order/changecompletedstatus?id=$id'),);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      notifyListeners();
      print(parsed);
      return parsed.map<OrderModel>((json) => OrderModel.fromJson(json)).toList();
    }
    else {
      throw Exception('Failed to load Orders');
    }
  }
}
