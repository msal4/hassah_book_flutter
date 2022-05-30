import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CaptchaPageArguments {
  const CaptchaPageArguments({required this.onMessage}) : assert(onMessage != null, "onMessage is required");

  final void Function(String message) onMessage;
}

class CaptchaPage extends StatelessWidget {
  static const routeName = "/captcha";

  CaptchaPage({required this.onMessage});

  final void Function(String message) onMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: WebView(
          initialUrl: "https://hassah-book.web.app/",
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from(
            [
              JavascriptChannel(
                name: 'Captcha',
                onMessageReceived: (JavascriptMessage message) {
                  if (onMessage != null) onMessage(message.message);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
