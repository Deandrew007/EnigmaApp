import "package:flutter/material.dart";

import 'chatscreenui.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Online Support")
      ),
      body: new ChatScreenUI(),
    );
  }
}
