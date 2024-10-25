import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket _socket;

  void connect() {
    _socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket.connect();

    _socket.on('connect', (_) {
      print('connected');
    });

    _socket.on('disconnect', (_) {
      print('disconnected');
    });
  }

  void sendMessage(String message) {
    _socket.emit('chat message', message);
  }

  void onMessageReceived(Function(String) callback) {
    _socket.on('chat message', (data) {
      callback(data);
    });
  }
}
