import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg'] ?? 'Bad request');
      break;
    case 401:
      showSnackBar(context, jsonDecode(response.body)['msg'] ?? 'Unauthorized');
      break;
    case 403:
      showSnackBar(context, jsonDecode(response.body)['msg'] ?? 'Forbidden');
      break;
    case 404:
      showSnackBar(context, jsonDecode(response.body)['msg'] ?? 'Not found');
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['msg'] ?? 'Internal server error');
      break;
    default:
      showSnackBar(context, response.body);
  }
}