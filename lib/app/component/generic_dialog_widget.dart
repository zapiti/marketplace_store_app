import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
//
// class GenericDialogWidget {
//   static showGenericDialog(BuildContext context,
//       {String title, String description,  Function() onConclude}) {
//     showDialog(
//         context: context,
//         builder: (dialogContext) {
//           return AlertDialog(
//             title: Text(title ?? ""),
//             content: Text(description ?? ""),
//             actions: [
//               TextButton(
//                 child: Text(
//                   "Fechar",
//                   style: AppThemeUtils.normalSize(
//                       color: AppThemeUtils.colorPrimary),
//                 ),
//                 onPressed: () {
//                   Navigator.of(dialogContext).pop();
//                   if(onConclude != null){
//                     onConclude();
//                   }
//
//                 },
//               )
//             ],
//           );
//         });
//   }
// }
