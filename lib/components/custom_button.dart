import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.width = double.infinity,
    this.onTap,
    this.isLoading = false,
  });

  final String label;
  final double? width;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        width: width,
        decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    // constraints: BoxConstraints(
                    //   maxHeight: 16,
                    //   maxWidth: 16,
                    //   minHeight: 16,
                    //   minWidth: 16,
                    // ),
                  ),
                ),
              const Gap(8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}