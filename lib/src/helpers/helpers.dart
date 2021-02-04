import 'package:flutter/material.dart' show Colors;
import 'package:flutter/services.dart' as services;

void changeStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(services
      .SystemUiOverlayStyle.light
      .copyWith(statusBarColor: Colors.transparent));
}

void changeStatusDark() {
  services.SystemChrome.setSystemUIOverlayStyle(services
      .SystemUiOverlayStyle.dark
      .copyWith(statusBarColor: Colors.transparent));
}
