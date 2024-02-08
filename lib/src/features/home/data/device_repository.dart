import 'dart:io';

import 'package:covid_19_app/src/features/home/domain/entities/info_device.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DeviceRepository {
  Future<InfoDevice> getInfoByPlatform();
}

class DeviceRepositoryImpl implements DeviceRepository {
  @override
  Future<InfoDevice> getInfoByPlatform() async {
    InfoDevice info;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;

      info = InfoDevice(
          deviceBrand: androidDeviceInfo.brand,
          deviceModel: androidDeviceInfo.model,
          deviceName: androidDeviceInfo.product,
          deviceType: androidDeviceInfo.device,
          version:
              'Android ${androidDeviceInfo.version.sdkInt}.${androidDeviceInfo.version.release}.${androidDeviceInfo.version.codename}.${androidDeviceInfo.version.incremental}');
    } else {
      IosDeviceInfo iosDeviceInfo = await DeviceInfoPlugin().iosInfo;

      info = InfoDevice(
          deviceBrand: iosDeviceInfo.localizedModel,
          deviceModel: iosDeviceInfo.model,
          deviceName: iosDeviceInfo.name,
          deviceType: iosDeviceInfo.systemName,
          version: iosDeviceInfo.systemVersion);
    }

    return info;
  }
}

final deviceRepositoryProvider = Provider<DeviceRepository>(
  (ref) => DeviceRepositoryImpl(),
);
