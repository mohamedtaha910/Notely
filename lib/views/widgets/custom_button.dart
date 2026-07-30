import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        // margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: const CircularProgressIndicator(color: Colors.white),
                )
              : const Text(
                  'Add',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
        ),
      ),
    );
  }
}
