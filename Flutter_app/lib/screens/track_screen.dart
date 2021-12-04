import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class Trackpad extends StatefulWidget {
  const Trackpad({Key? key}) : super(key: key);

  @override
  _TrackpadState createState() => _TrackpadState();
}

class _TrackpadState extends State<Trackpad> {
  late io.Socket socket;
  void connect() {
    socket = io.io('http://10.0.2.2:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    print('hello');
    socket.connect();
    socket.emit('msg', 'hi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Mouse Controller'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          connect();
        },
      ),
      body: Container(
        color: Colors.red,
        child: GestureDetector(
          onPanDown: (value) {
            print(value.localPosition);
          },
          onPanUpdate: (value) {
            print(value.localPosition);
          },
          onPanEnd: (value) {
            null;
          },
        ),
      ),
    );
  }
}
