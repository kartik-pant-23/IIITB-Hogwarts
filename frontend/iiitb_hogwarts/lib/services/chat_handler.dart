import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatHandler {

  String roomId, type;
  Function sendMessage, receiveMessage;
  IO.Socket socket;

  ChatHandler({this.roomId, this.type});

  void initChat() {
    try {
      socket = IO.io(
        'https://$BASE_URL',
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': true,
          'forceNew': true,
        },
      );
      socket.on('connect', (data) => print('ChatSocketConnected: '+socket.id));
      socket.emit('joinRoom', <String, String>{
        "roomId": roomId,
        "type": type
      });
    } catch (err) {
      print(err);
    }
  }

  void disconnect() {
    socket.disconnect();
  }

}