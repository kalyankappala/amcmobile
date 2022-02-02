import 'package:amcmobile/pages/navigation/service/amctheme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'oauth2_dio.dart';

final storage=GetStorage();

class OAuthSecureStorage extends OAuthStorage {
  static final String accessTokenKey = 'accessToken';
  static final String refreshTokenKey = 'refreshToken';
  static final String expirationKey = 'expiration';

  @override
  Future<OAuthToken> fetch() async {
    return OAuthToken(
        accessToken: storage.read(accessTokenKey),
        refreshToken: storage.read(refreshTokenKey),
        expiration: DateTime.fromMillisecondsSinceEpoch(storage.read(expirationKey)));

    /*return OAuthToken.fromMap ({
      "access_token": await storage.read(accessTokenKey),
      "refresh_token": await storage.read(refreshTokenKey),
      "expires": await storage.read(expires) // a integer
    });*/
  }

  @override
  Future<OAuthToken> save(OAuthToken token) async {
    await storage.write(accessTokenKey,  token.accessToken);
    await storage.write( refreshTokenKey, token.refreshToken);
    await storage.write( expirationKey,token.expiration!.millisecondsSinceEpoch);
    return token;
  }

  Future<void> clear() async {
    await storage.remove( accessTokenKey);
    await storage.remove( refreshTokenKey);
    await storage.remove( expirationKey);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // add this

    );
  }
}
