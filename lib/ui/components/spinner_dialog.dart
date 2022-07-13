import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  Get.dialog(
    AlertDialog(
      title: const Text('Dialog'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text(
            'Aguarde...',
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

// void showLoading(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return SimpleDialog(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               CircularProgressIndicator(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Aguarde...',
//                 textAlign: TextAlign.center,
//               )
//             ],
//           )
//         ],
//       );
//     },
//   );
// }

void hideLoading() {
  Get.back();
  // if (Navigator.canPop(context)) {
  //   Navigator.of(context).pop();
  // }
}
