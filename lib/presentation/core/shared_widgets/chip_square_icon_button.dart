import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class ChipSquareIconButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double width;
  final double height;
  final String? iconPath;
  final Color? iconColor;
  const ChipSquareIconButton({
    Key? key,
    this.onTap,
    this.padding = 7.5,
    this.backgroundColor,
    this.borderColor,
    this.width = 36,
    this.height = 36,
    this.iconPath,
    this.iconColor,
  }) : super(key: key);

  @override
  State<ChipSquareIconButton> createState() => _ChipSquareIconButtonState();
}

class _ChipSquareIconButtonState extends State<ChipSquareIconButton> {
  bool _isLoading = false;

  void _onTap() {
    final onTap = widget.onTap;
    if (onTap == null) return;
    if (onTap is Future Function()) {
      _handleAsyncTap(onTap);
    } else {
      _handleSyncTap(onTap);
    }
  }

  Future<void> _handleAsyncTap(Future<void> Function() onTap) async {
    setState(() => _isLoading = true);
    await onTap();
    setState(() => _isLoading = false);
  }

  void _handleSyncTap(VoidCallback onTap) => onTap();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap != null
          ? _isLoading
              ? null
              : _onTap
          : null,
      child: Ink(
        padding: EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.white,
          border: Border.all(color: widget.borderColor ?? AppColors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        width: widget.width,
        height: widget.height,
        child: _isLoading
            ? CircularProgressIndicator(
                color: widget.iconColor ?? AppColors.black,
                strokeWidth: 3,
              )
            : widget.iconPath != null
                ? ImageIcon(
                    AssetImage(widget.iconPath!),
                    color: widget.iconColor ?? AppColors.black,
                  )
                : Icon(
                    Icons.square_rounded,
                    color: widget.iconColor ?? AppColors.black,
                  ),
      ),
    );
  }
}
