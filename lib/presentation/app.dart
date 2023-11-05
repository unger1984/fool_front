import 'package:flutter/material.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

@immutable
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _connect();
  }

  void _connect() {
    final wsUrl = Uri.parse('wss://localhost:8084/ws');
    WebSocketChannel channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
