import 'package:flutter/material.dart';
import '../core/utils/const.dart';

const double borderRadius = 20;

class Styles {
  static final _basicBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: kPrimaryColor, width: 1),
    borderRadius: BorderRadius.circular(borderRadius),
  );

  static InputDecoration inputText({
    double hPadding = 20,
    double vPadding = 8,
    Color errorColor = kErrorColor,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        //if (states.contains(MaterialState.focused)) {
        //  return Colors.green;
        //}
        if (states.contains(MaterialState.error)) {
          return errorColor;
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return Colors.white;
      }),
      border: _basicBorder,
      disabledBorder: _basicBorder,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: errorColor, width: 1.5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      errorStyle: const TextStyle(height: 0, fontSize: 0),
      // const TextStyle(color: errorFieldColorBorder,),
      enabledBorder: _basicBorder,
      hintStyle: const TextStyle(
        color: Colors.black12,
        fontWeight: FontWeight.normal,
      ),
      helperStyle: const TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.normal,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: vPadding,
      ),
    );
  }
}
