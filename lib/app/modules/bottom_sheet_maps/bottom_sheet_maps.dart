import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

import 'presentation/widgets/icon_button_maps_widget.dart';

abstract class BottomSheetMaps {
  static Future<void> show({
    @required BuildContext context,
    @required String title,
    @required double latitude,
    @required double longitude,
  }) async {
    final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;

    await showModalBottomSheet(
      context: context,
      builder: (_) {
        final Coords coords = Coords(
          latitude,
          longitude,
        );

        return Container(
          color: AppColors.white,
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 3
                    : 5,
            childAspectRatio: 1.0,
            children: List.generate(
              availableMaps.length,
              (index) {
                final AvailableMap availableMap = availableMaps[index];

                return IconButtonMaps(
                  image: SvgPicture.asset(
                    'assets/images/maps/${describeEnum(availableMap.mapType)}.svg',
                  ),
                  title: availableMap.mapName,
                  onTap: () {
                    availableMap.showMarker(
                      coords: coords,
                      title: title,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
