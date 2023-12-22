import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  //on State
  void name(args);

  Future<void> alaunchUrl(Uri url) async {
    if (!await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }
}
