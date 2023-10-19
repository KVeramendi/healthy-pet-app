// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

import '../../colors/app_colors.dart';
import '../../shared_widgets/custom_text.dart';
import '../../shared_widgets/loading_indicator.dart';
import '../../styles/app_styles.dart';

class Modals {
  // static Future<ImageSource?> imageSource(BuildContext context) {
  //   if (Platform.isIOS) {
  //     return showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   onPressed: () => Navigator.pop(context, ImageSource.camera),
  //                   child: const CustomText('Cámara'),
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   onPressed: () =>
  //                       Navigator.pop(context, ImageSource.gallery),
  //                   child: const CustomText('Galería'),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         );
  //       },
  //       barrierDismissible: false,
  //     );
  //   } else {
  //     return showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               leading: const Icon(Icons.camera_alt_rounded),
  //               title: const CustomText('Cámara'),
  //               onTap: () => Navigator.pop(context, ImageSource.camera),
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.image_rounded),
  //               title: const CustomText('Galería'),
  //               onTap: () => Navigator.pop(context, ImageSource.gallery),
  //             ),
  //           ],
  //         );
  //       },
  //       isDismissible: false,
  //     );
  //   }
  // }

  static Future<void> showImageDialog(BuildContext context, String url) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      'Vista previa',
                      style: AppStyles.mavenPro16BoldDarkGray,
                    ),
                    IconButton(
                      splashRadius: 18,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: precacheImage(NetworkImage(url), context),
                builder: (_, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const LoadingIndicator();
                    case ConnectionState.done:
                    default:
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Image.network(url),
                      );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
