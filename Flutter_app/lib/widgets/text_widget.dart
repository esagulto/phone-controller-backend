import 'package:flutter/material.dart';
import 'package:flutter_app/functions/value_provider.dart';
import 'package:flutter_app/screens/track_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/functions/connections.dart';

class CustomTextEditor extends StatelessWidget {
  CustomTextEditor({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: textController,
              onChanged: (value) => {
                textController.text = value,
                textController.selection = TextSelection.fromPosition(
                    TextPosition(offset: textController.text.length)),
                Provider.of<ValueProvider>(context, listen: false).userMessage =
                    value,
                print(Provider.of<ValueProvider>(context, listen: false)
                    .userMessage),
              },
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              commandTransfer.sendMessage(
                  Provider.of<ValueProvider>(context, listen: false)
                      .userMessage);
            },
            icon: const Icon(Icons.send)),
      ],
    );
  }
}
