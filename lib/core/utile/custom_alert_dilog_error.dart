import 'package:flutter/material.dart';

class CustomAlertDialogError extends StatelessWidget {
  const CustomAlertDialogError({super.key, required this.errMassage});
  final String errMassage;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text("Error"),
      icon: Icon(Icons.error),
      content: Container(
        height: h * 0.05,
        width: h * 0.05,
        child: Column(
          children: [
            Text(errMassage, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
