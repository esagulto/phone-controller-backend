import 'package:flutter/material.dart';
import 'package:flutter_app/functions/connections.dart';

CommandTransfer commandTransfer = CommandTransfer();

class Trackpad extends StatefulWidget {
  const Trackpad({Key? key}) : super(key: key);

  @override
  _TrackpadState createState() => _TrackpadState();
}

class _TrackpadState extends State<Trackpad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Mouse Controller'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          commandTransfer.connect();
        },
      ),
      body: Container(
        color: Colors.red,
        child: GestureDetector(
          onPanUpdate: (value) {
            commandTransfer.sendTrackMovement(value.delta);
          },
          onPanEnd: (value) {
            commandTransfer.sendPanEnd();
          },
        ),
      ),
    );
  }
}
