import 'package:bio_medika/core/constant/app_assets_lottie.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RequestStatusHandler extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  final bool loading;
  final bool isSliver;
  final double? width;
  final double? height;
  final bool isTopImage;
  final bool isBottomNav;
  final bool needSearch;
  final bool addList;
  const RequestStatusHandler({
    super.key,
    required this.statusRequest,
    required this.child,
    this.loading = false,
    this.isSliver = false,
    this.needSearch = false,
    this.width,
    this.isTopImage = false,
    this.addList = false,
    this.height,
    this.isBottomNav = false,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContentBasedOnStatus();
  }

  Widget _buildContentBasedOnStatus() {
    if (isSliver) {
      return SliverToBoxAdapter(
        child: _statusWidget(),
      );
    } else {
      return _statusWidget();
    }
  }

  Widget _statusWidget() {
    switch (statusRequest) {
      case StatusRequest.empty:
        return _buildLottie(assetPath: AppAssetsLottie.empty);
      case StatusRequest.serverFailure:
        return _buildLottie(assetPath: AppAssetsLottie.error404, repeat: false);
      case StatusRequest.offline:
        return _buildLottie(assetPath: AppAssetsLottie.offline);
      case StatusRequest.serverException:
        return _buildLottie(assetPath: AppAssetsLottie.error404, repeat: false);
      case StatusRequest.search:
        return needSearch
            ? _buildLottie(assetPath: AppAssetsLottie.search)
            : child;
      case StatusRequest.failSearch:
        return needSearch
            ? _buildLottie(assetPath: AppAssetsLottie.failSearch)
            : child;
      case StatusRequest.loading:
        return loading
            ? _buildLottie(assetPath: AppAssetsLottie.loading)
            : child;
      default:
        return child;
    }
  }

  Widget _buildLottie({required String assetPath, bool repeat = true}) {
    final size = MediaQuery.of(Get.context!).size;
    return addList
        ? Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: !isBottomNav ? 0 : AppConstants.val_78,
                          top: isTopImage ? size.height * 0.125 : 0),
                      child: Lottie.asset(
                        assetPath,
                        frameRate: FrameRate(120),
                        repeat: repeat,
                        width: size.width * 0.85,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: !isBottomNav ? 0 : AppConstants.val_78,
                    top: isTopImage ? size.height * 0.125 : 0),
                child: Lottie.asset(
                  assetPath,
                  frameRate: FrameRate(120),
                  repeat: repeat,
                  width: size.width * 0.85,
                ),
              ),
            ),
          );
  }
}
