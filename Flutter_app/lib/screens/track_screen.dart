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
      body: Column(children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.white,
            child: GestureDetector(
              onPanUpdate: (value) {
                commandTransfer.sendTrackMovement(value.delta);
              },
              onPanEnd: (value) {
                commandTransfer.sendPanEnd();
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: GestureDetector(
                    onTap: () {
                      commandTransfer.sendClickCommand('LMB');
                    },
                    child: const Center(
                        child: Text(
                      'LMB',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: GestureDetector(
                    onTap: () {
                      commandTransfer.sendClickCommand('RMB');
                    },
                    child: const Center(
                        child: Text(
                      'RMB',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
