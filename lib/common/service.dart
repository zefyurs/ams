import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void customLaunchUrl(url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    Get.snackbar('접속할 수 없습니다.', '다시 시도해주세요.');
  }
}
