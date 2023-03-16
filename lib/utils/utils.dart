import 'package:flutter/material.dart';

showSnackBar(BuildContext Context, String text){
  return ScaffoldMessenger.of(Context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}