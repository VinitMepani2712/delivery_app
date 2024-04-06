import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle textStyle() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle headerTextStyle() {
    return const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle lightTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );
  }

  static TextStyle foodNameTextStyle() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
  }

  static TextStyle foodDescriptionTextStyle() {
    
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w200,
      overflow: TextOverflow.ellipsis,
      color: Colors.green,
    );
  }

  static TextStyle priceTextStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 0, 0, 0),
    );
  }

  static TextStyle countTextStyle() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
  }

  static TextStyle foodDetailsTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w100,
      color: Colors.grey,
    );
  }

  static TextStyle buttonTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle boldTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
