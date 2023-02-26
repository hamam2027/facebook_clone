import 'package:flutter/material.dart';

Widget myform({
  required TextEditingController controller,
  required String labltext,
  required Function valid,
  required bool ubs,
  IconData? icon,
  Function? sufixfun,
  IconData? prifix,
  IconData? prifixicon,
  required TextInputType typ,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      keyboardType: typ,
      obscureText: ubs,
      validator: (val) {
        return valid(val);
      },
      controller: controller,
      decoration: InputDecoration(
        prefix: Icon(prifix),
        prefixIcon: Icon(prifixicon),
        suffixIcon: IconButton(
            onPressed: () {
              sufixfun!();
            },
            icon: Icon(icon)),
        label: Text(labltext),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 3, color: Colors.black)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 3, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 3, color: Colors.red)),
      ),
    ),
  );
}

List<String> wochlist = [
  "For You",
  "Live",
  " Gaming",
  "Reels",
  "Following",
  "Saved",
];
