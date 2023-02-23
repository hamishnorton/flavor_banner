library flavor_banner;

import 'package:flutter/material.dart';

/// Banner to show version, flavor as a banner in the top left of every screen
class FlavorBanner extends StatefulWidget {
  const FlavorBanner({
    super.key,
    required this.color,
    required this.message,
    required this.showBanner,
    required this.child,
    this.onTapShow,
  });

  final String message;
  final Color? color;
  final bool showBanner;
  final Widget? onTapShow;

  final Widget child;

  @override
  State<FlavorBanner> createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  bool isOnTapShow = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.showBanner) return widget.child;

    return Stack(
      children: [
        // full screen under lay with onTap to hide what's on top
        GestureDetector(
            child: widget.child,
            onTap: () {
              setState(() {
                isOnTapShow = false;
              });
            }),
        GestureDetector(
          // requried as Banner not seen like a typical widget
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              isOnTapShow = true;
            });
          },
          //TODO:  Rework this, perhaps based on: https://www.tutorialkart.com/flutter/flutter-banner-location/
          //Thought: Might be able to set the child
          child: SizedBox(
            height: 60,
            width: 60,
            child: Directionality(
              textDirection: Directionality.of(context),
              child: (widget.color == null)
                  ? Banner(
                      message: widget.message,
                      location: BannerLocation.topStart,
                    )
                  : Banner(
                      color:
                          widget.color!, // color must be set if being provided
                      message: widget.message,
                      location: BannerLocation.topStart,
                      textStyle: TextStyle(
                        color:
                            (HSLColor.fromColor(widget.color!).lightness < 0.8
                                ? Colors.white
                                : Colors.black87),
                        //   fontSize: 12.0 * 0.85,
                        //   fontWeight: FontWeight.w900,
                        //   height: 1.0,
                      ),
                    ),
            ),
          ),
        ),
        // Alternative Rendering
        // CustomPaint(
        //     painter: (color == null)
        //         ? BannerPainter(
        //             message: message,
        //             textDirection: Directionality.of(context),
        //             layoutDirection: Directionality.of(context),
        //             location: BannerLocation.topStart,
        //           )
        //         : BannerPainter(
        //             message: message,
        //             textDirection: Directionality.of(context),
        //             layoutDirection: Directionality.of(context),
        //             location: BannerLocation.topStart,
        //             color: color!,
        //           )),
        if (widget.onTapShow != null && isOnTapShow) widget.onTapShow!
      ],
    );
  }
}
