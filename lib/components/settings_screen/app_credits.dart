import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/title_text.dart';
import 'package:url_launcher/link.dart';

class AppCredits extends StatelessWidget {
  const AppCredits({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const TitleText('This app is created by Rahul Gupta'),
          const Text(
            'Click below to know more about the project',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          link(),
        ],
      ),
    );
  }
}

Widget link() {
  return Link(
    target: LinkTarget.blank,
    uri: Uri.parse('https://github.com/rahulob/gym_logger'),
    builder: (context, followLink) => IconButton(
      onPressed: followLink,
      icon: const Icon(FontAwesomeIcons.github),
    ),
  );
}
