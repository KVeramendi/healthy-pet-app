import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double dimension;
  final Color color;
  const LoadingIndicator({
    Key? key,
    this.dimension = 48,
    this.color = AppColors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
