import 'package:covid_19_app/src/features/home/domain/entities/details_data.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/state_details_controller.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/widgets/principal_image.dart';
import 'package:covid_19_app/src/tools/custom_colors.dart';
import 'package:covid_19_app/src/tools/dimens.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class Carousel extends StatelessWidget {
  final StateDetailsController controller;

  const Carousel({
    super.key,
    required this.data,
    required this.controller,
  });

  final DetailsData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          InfiniteCarousel.builder(
            itemCount: 50,
            itemExtent: 210,
            loop: true,
            axisDirection: Axis.horizontal,
            velocityFactor: 0.2,
            itemBuilder: (context, itemIndex, realIndex) => itemIndex == 0
                ? Hero(tag: data.state.name, child: const PrincipalImage())
                : const PrincipalImage(),
          ),
          Positioned(
            bottom: 0,
            right: dimens.fullWidth(context) * .14,
            child: IconButton.filled(
              onPressed: () async =>
                  await controller.urlLaunch(data.state.covid19Site),
              icon: const Icon(
                Icons.info_outline_rounded,
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(customColors.orange)),
            ),
          )
        ],
      ),
    );
  }
}
