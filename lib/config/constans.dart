import 'dart:io' as platform;
import 'package:flutter/material.dart';

const String BASE_URL = "https://api-nodejs-todolist.herokuapp.com/";

void showSnackBar(BuildContext context, bool isError, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message ?? '',
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(color: Colors.white),
    ),
    backgroundColor: isError ? Colors.red : Colors.black,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 100,
      right: 20,
      left: 20,
    ),
  ));
}
