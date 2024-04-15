import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString output = "".obs;
  getBalancedSubstrings(String S) {
    List<String> result = [];
//abba
    // Function to check if a substring is balanced
    bool isBalanced(String substring) {
      Set<String> uniqueChars = Set.from(substring.split(''));
      if (uniqueChars.length != 2) return false;
      int count1 = substring.replaceAll(uniqueChars.elementAt(0), '').length;
      int count2 = substring.replaceAll(uniqueChars.elementAt(1), '').length;
      return count1 == count2;
    }

    // Iterate through all possible substrings
    for (int i = 0; i < S.length; i++) {
      for (int j = i + 2; j <= S.length; j++) {
        String substring = S.substring(i, j);
        //ab
        if (isBalanced(substring)) {
          if (result.isEmpty || substring.length > result[0].length) {
            result = [substring];
          } else if (substring.length == result[0].length) {
            result.add(substring);
          }
        }
      }
    }
    output.value = result.toString();
    print("object ${output.value.toString()}");
    //return result;
  }
}
