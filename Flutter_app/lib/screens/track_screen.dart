import 'package:flutter/material.dart';
import 'package:flutter_app/functions/connections.dart';
import 'package:flutter_app/widgets/text_widget.dart';

CommandTransfer commandTransfer = CommandTransfer();

class Trackpad extends StatefulWidget {
  const Trackpad({Key? key}) : super(key: key);

  @override
  _TrackpadState createState() => _TrackpadState();
}

class _TrackpadState extends State<Trackpad> {
  bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Remote Cursor Controller'),
            Switch(
                value: switchVal,
                onChanged: (value) {
                  setState(() {
                    switchVal = value;
                  });
                  if (value) {
                    commandTransfer.connect();
                    if (commandTransfer.isUserConnected == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('user now connected')));
                    }
                  } else {
                    commandTransfer.disconnect();
                    if (commandTransfer.isUserConnected == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('user now disconnected')));
                    }
                  }
                })
          ],
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: CustomTextEditor(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.white,
            child: GestureDetector(
              onPanUpdate: (value) {
                if (commandTransfer.isConnected() == true) {
                  commandTransfer.sendTrackMovement(value.delta);
                } else {
                  print('not connected');
                }
              },
              onPanEnd: (value) {
                if (commandTransfer.isConnected() == true) {
                  commandTransfer.sendPanEnd();
                }
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
