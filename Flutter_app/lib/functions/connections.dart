import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

io.Socket socket = io.io('http://192.168.1.13:3000', <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': false,
});

class CommandTransfer {
  void connect() {
    print('hello');
    socket.connect();
    socket.emit('msg', 'hi');
  }

  void sendTrackMovement(Offset movement) {
    var initialPosition = json.encode({
      "x": movement.dx,
      "y": movement.dy,
    });
    print(initialPosition);
    socket.emit('onPanDown', initialPosition);
  }

  void sendClickCommand(String mouseButton) {
    socket.emit('Click', mouseButton);
  }

  void sendPanEnd() {
    socket.emit('onPanEnd', 'hands up');
  }
}
