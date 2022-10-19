import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/order_model.dart';

class OrderProvider extends ChangeNotifier {

  Future<List<OrderModel>> fetchPost() async {
    final response =
    await http.get(Uri.parse('http://barbarossa-restaurant.herokuapp.com/api/order/current'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      notifyListeners();
      return parsed.map<OrderModel>((json) => OrderModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Orders');
    }

  }
}
