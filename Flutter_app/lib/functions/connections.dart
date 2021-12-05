import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

io.Socket socket = io.io('http://192.168.1.13:3000', <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': false,
});

class CommandTransfer {
  bool isUserConnected = false;

  void changeUserState() {
    isUserConnected = !isUserConnected;
    print('state Change: $isUserConnected');
  }

  void connect() {
    print('hello');
    socket.connect();
    socket.on(
        'server response',
        (response) => {
              print(response),
              changeUserState(),
              print('is user connected? : $isUserConnected')
            });
  }

  bool isConnected() {
    return socket.connected;
  }

  void disconnect() {
    socket.disconnect();
    print('disconnect');
    changeUserState();
    print(isUserConnected);
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
