import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareButton extends StatelessWidget {
  final Icon buttonIcon;
  final String destiny_name;
  final String url;
  const ShareButton({
    Key? key,
    required this.url,
    required this.buttonIcon,
    required this.destiny_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Ver en ${destiny_name}",
      child: IconButton(
        onPressed: () {
          _launchInBrowser(context);
        },
        icon: buttonIcon,
      ),
    );
  }

  Future<void> _launchInBrowser(context) async {
    print(url);
    if (url == '') {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('No se encontró el sitio')),
        );
    } else if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}