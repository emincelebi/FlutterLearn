import 'dart:io';

import 'package:flutter_full_learn/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(Uri path) async {
    !await launchUrl(path);
  }
}

class FileDownload extends IFileDownload  with ShareMixin{
  //üst sınıfın özelliklerini tekrar et boş olanları doldur
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    return true;
  }
  
}

class SMSDownload implements IFileDownload {
  //hepsini kendin yaz kalıtım aldığı sınıfı direkt kendine aktarır
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');
    return true;
  }

  @override
  Future<void> toShare(Uri path) async {
    !await launchUrl("sms: $path" as Uri);
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
