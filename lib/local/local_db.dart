// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  late SharedPreferences mPrefs;

  Future<String?> getVideoID(String channelID) async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(channelID);
  }

  Future<bool> setVideoID(String channelID, String videoID) async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.setString(channelID, videoID);
  }
}
