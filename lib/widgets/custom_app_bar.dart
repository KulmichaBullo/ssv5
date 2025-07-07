import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'custom_image_view.dart';

/**
 * CustomAppBar - A reusable app bar component with location and notification features
 * 
 * @param locationText - Text to display in the location button
 * @param notificationIconPath - Path to the notification icon image
 * @param showLocation - Whether to show the location button
 * @param showNotification - Whether to show the notification icon
 * @param onLocationTap - Callback function when location button is tapped
 * @param onNotificationTap - Callback function when notification icon is tapped
 * @param backgroundColor - Background color of the app bar
 * @param elevation - Elevation/shadow of the app bar
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.locationText,
    this.notificationIconPath,
    this.showLocation,
    this.showNotification,
    this.onLocationTap,
    this.onNotificationTap,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  /// Text to display in the location button
  final String? locationText;

  /// Path to the notification icon image
  final String? notificationIconPath;

  /// Whether to show the location button
  final bool? showLocation;

  /// Whether to show the notification icon
  final bool? showNotification;

  /// Callback function when location button is tapped
  final VoidCallback? onLocationTap;

  /// Callback function when notification icon is tapped
  final VoidCallback? onNotificationTap;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Elevation/shadow of the app bar
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final bool shouldShowLocation = showLocation ?? true;
    final bool shouldShowNotification = showNotification ?? true;
    final String defaultLocationText = locationText ?? "Singaraja, Bali";
    final String defaultNotificationIcon = notificationIconPath ??
        "assets/images/img_music_audio_bell_notifications.svg";
    final Color defaultBackgroundColor =
        backgroundColor ?? appTheme.whiteCustom;
    final double defaultElevation = elevation ?? 4.0;

    return AppBar(
      backgroundColor: defaultBackgroundColor,
      elevation: defaultElevation,
      shadowColor: appTheme.colorFF8888,
      automaticallyImplyLeading: false,
      toolbarHeight: 50.h,
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (shouldShowLocation)
                      _buildLocationButton(defaultLocationText),
                    if (!shouldShowLocation) const SizedBox.shrink(),
                    if (shouldShowNotification)
                      _buildNotificationIcon(defaultNotificationIcon),
                    if (!shouldShowNotification) const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the location button widget
  Widget _buildLocationButton(String text) {
    return ElevatedButton(
      onPressed: onLocationTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: appTheme.colorFFF2F3,
        foregroundColor: appTheme.colorFF0D18,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
        minimumSize: Size(0, 30.h),
      ),
      child: Text(
        text,
        style: TextStyleHelper.instance.body14Regular,
      ),
    );
  }

  /// Builds the notification icon widget
  Widget _buildNotificationIcon(String iconPath) {
    return GestureDetector(
      onTap: onNotificationTap,
      child: CustomImageView(
        imagePath: iconPath,
        height: 24.h,
        width: 24.h,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
