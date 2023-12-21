import 'dart:convert';

import 'package:flumuttslimer/core/helpers/functions.dart';
import 'package:flumuttslimer/core/network/Exceptions.dart';
import 'package:flumuttslimer/core/network/message.dart';
import 'package:flumuttslimer/core/network/server_config.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/models/public_info_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class RegisterServices {
  register(PublicInfoModel info) async {
    try {
      if (await checkInternetConnection()) {
        String url = '${ServerConfig.domainName}user/register';
        var response = await http.post(Uri.parse(url),
            body: info.toJson(), headers: ServerConfig.headers);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          info.token = data['data'];
          final box = await Hive.openBox<PublicInfoModel>('user');
          await box.add(info);
          return Messages.SUCCESS;
        } else {
          throw ServerFaildException(message: Messages.SERVER_ERROR);
        }
      } else {
        throw NoInternetExceptions(
            message: Messages.NO_INTERNET_CONNECTION_ERROR);
      }
    } on ServerFaildException catch (e) {
      return e.message;
    } on NoInternetExceptions catch (e) {
      return e.message;
    }
  }
}
