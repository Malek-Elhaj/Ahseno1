import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  Future<void> _lan(String url)
  async {
    final Uri url=Uri(scheme: "tel",path: "0924711536");
    if(!await launchUrl(
        url,
        mode: LaunchMode.externalApplication
    )) {}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: (){
              _lan("fddfd");
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
