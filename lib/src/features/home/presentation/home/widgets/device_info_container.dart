import 'package:covid_19_app/src/features/home/presentation/home/home_state.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DeviceInfoContainer extends StatelessWidget {
  const DeviceInfoContainer({
    super.key,
    required this.clockStream,
    required this.state,
  });

  final AsyncValue<DateTime> clockStream;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 190,
      child: Container(
        height: 180,
        width: dimens.fullWidth(context) * .9,
        margin:
            EdgeInsets.symmetric(horizontal: dimens.fullWidth(context) * .05),
        decoration: BoxDecoration(
            color: customColors.white,
            borderRadius: dimens.borderRadiusContainer(10),
            border: Border.all(color: Colors.transparent),
            boxShadow: [
              BoxShadow(
                  color: customColors.black, spreadRadius: 0.5, blurRadius: 2)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: dimens.fullWidth(context) * .75 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    DateFormat.jms()
                        .format(clockStream.value ?? DateTime.now()),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const CustomText(
                    'Hora actual',
                    fontSize: 12,
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    'Marca del dispositivo',
                    fontSize: 12,
                  ),
                  CustomText(
                    state.deviceInfo?.deviceBrand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    'Modelo del dispositivo',
                    fontSize: 12,
                  ),
                  CustomText(
                    state.deviceInfo?.deviceModel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: dimens.fullWidth(context) * .75 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    'Nombre del dispositivo',
                    fontSize: 12,
                  ),
                  CustomText(
                    state.deviceInfo?.deviceName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    'Tipo de dispositivo',
                    fontSize: 12,
                  ),
                  CustomText(
                    state.deviceInfo?.deviceType,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    'Tipo de dispositivo',
                    fontSize: 12,
                  ),
                  CustomText(
                    state.deviceInfo?.version,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
