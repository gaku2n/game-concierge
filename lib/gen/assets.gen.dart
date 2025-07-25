/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/launcher_icon
  $AssetsImagesLauncherIconGen get launcherIcon =>
      const $AssetsImagesLauncherIconGen();
}

class $AssetsImagesLauncherIconGen {
  const $AssetsImagesLauncherIconGen();

  /// Directory path: assets/images/launcher_icon/android
  $AssetsImagesLauncherIconAndroidGen get android =>
      const $AssetsImagesLauncherIconAndroidGen();

  /// Directory path: assets/images/launcher_icon/ios
  $AssetsImagesLauncherIconIosGen get ios =>
      const $AssetsImagesLauncherIconIosGen();
}

class $AssetsImagesLauncherIconAndroidGen {
  const $AssetsImagesLauncherIconAndroidGen();

  /// File path: assets/images/launcher_icon/android/dev.png
  AssetGenImage get dev =>
      const AssetGenImage('assets/images/launcher_icon/android/dev.png');

  /// File path: assets/images/launcher_icon/android/prod.png
  AssetGenImage get prod =>
      const AssetGenImage('assets/images/launcher_icon/android/prod.png');

  /// File path: assets/images/launcher_icon/android/stg.png
  AssetGenImage get stg =>
      const AssetGenImage('assets/images/launcher_icon/android/stg.png');

  /// List of all assets
  List<AssetGenImage> get values => [dev, prod, stg];
}

class $AssetsImagesLauncherIconIosGen {
  const $AssetsImagesLauncherIconIosGen();

  /// File path: assets/images/launcher_icon/ios/dev.png
  AssetGenImage get dev =>
      const AssetGenImage('assets/images/launcher_icon/ios/dev.png');

  /// File path: assets/images/launcher_icon/ios/prod.png
  AssetGenImage get prod =>
      const AssetGenImage('assets/images/launcher_icon/ios/prod.png');

  /// File path: assets/images/launcher_icon/ios/stg.png
  AssetGenImage get stg =>
      const AssetGenImage('assets/images/launcher_icon/ios/stg.png');

  /// List of all assets
  List<AssetGenImage> get values => [dev, prod, stg];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
