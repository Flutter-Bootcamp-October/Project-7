import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';

class UpdateButton extends StatefulWidget {
  @override
  State<UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userController =
            TextEditingController(text: currentUser.name),
        emailController = TextEditingController(text: currentUser.email),
        paswwordController = TextEditingController(text: currentUser.password);
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.amber,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextButton(
              onPressed: () {
                if (userController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    paswwordController.text.isNotEmpty) {
                  currentUser.name = userController.text;
                  currentUser.email = emailController.text;
                  currentUser.password = paswwordController.text;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title:
                            const Text("Changes has been Seaved successfully!"),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      )
    );
  }
}