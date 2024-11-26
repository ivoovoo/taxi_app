import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milania_taxi/login_page.dart';

const greyColor1 = Color(0xFFDADADA);
const greyColor2 = Color(0xFF929292);

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late final DraggableScrollableController controller;

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController();
    controller.addListener(() {
      print('==-=------  ${controller.size}');
      print('==-=------  ${controller.pixels}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const MapView(),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomBlur(),
          ),
          Column(
            children: [
              SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 20),
                  child: MenuButton(
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
          DraggableBottomSheet(controller: controller)
        ],
      ),
    );
  }
}

class ChooseRideDialog extends StatelessWidget {
  const ChooseRideDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardRow(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Expanded(
                  child: ButtonWithTitle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  const CardRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: greyColor1), borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/mastercard.svg'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '**** 0872',
                  style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 16,
                    color: greyColor2,
                    fontVariations: [
                      FontVariation.opticalSize(56),
                      FontVariation.width(128),
                      FontVariation.weight(600),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Change',
              style: TextStyle(
                fontFamily: 'font',
                fontSize: 16,
                color: greyColor2,
                fontVariations: [
                  FontVariation.opticalSize(56),
                  FontVariation.width(128),
                  FontVariation.weight(600),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWithTitle extends StatelessWidget {
  const ButtonWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: blackColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Text(
            textAlign: TextAlign.center,
            'Order now',
            style: TextStyle(
              fontFamily: 'font',
              fontSize: 16,
              color: Colors.white,
              fontVariations: [
                FontVariation.opticalSize(56),
                FontVariation.width(128),
                FontVariation.weight(600),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//END =============================

//COMPONENTS==================================================================

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({
    super.key,
    required this.controller,
  });

  final DraggableScrollableController controller;

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: widget.controller,
        initialChildSize: 1 * (1 / 3),
        minChildSize: 1 * (1 / 3),
        maxChildSize: 1 * (1 / 1.55),
        builder: (
          ctx,
          controller,
        ) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                WhereToRow(
                  onGoTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                            child: const ChooseRideDialog(),
                          );
                        });
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        SafeArea(
                          bottom: true,
                          top: false,
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Tile(),
                                    ),
                                    SizedBox(
                                      width: 23,
                                    ),
                                    Expanded(
                                      child: TileSec(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              TileThird(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class TileThird extends StatelessWidget {
  const TileThird({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF151513),
            Color(0xFF8A7002),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      //root column
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //first row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/bones.svg'),
                      const SizedBox(
                        width: 16,
                      ),
                      const Expanded(
                        child: Text(
                          'Places near you',
                          style: TextStyle(
                            height: 0.9,
                            fontFamily: 'font',
                            fontSize: 24,
                            color: Colors.white,
                            fontVariations: [
                              FontVariation.opticalSize(56),
                              FontVariation.width(128),
                              FontVariation.weight(600),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'GO!',
                            style: TextStyle(
                              height: 1,
                              fontFamily: 'font',
                              fontSize: 24,
                              color: Colors.white,
                              fontVariations: [
                                FontVariation.opticalSize(56),
                                FontVariation.width(128),
                                FontVariation.weight(600),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SvgPicture.asset('assets/arrow.svg'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            //second row
            const Row(
              children: [
                Expanded(
                  // TODO
                  child: SmallMap(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SmallMap extends StatelessWidget {
  const SmallMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/mapsicle.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFFDC71),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16)),
              child: Image.asset('assets/coffee.png'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angelina Paris Cafe',
                  style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 16,
                    color: blackColor,
                    fontVariations: [
                      FontVariation.opticalSize(56),
                      FontVariation.width(128),
                      FontVariation.weight(600),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '13 min',
                  style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 16,
                    color: blackColor,
                    fontVariations: [
                      FontVariation.opticalSize(56),
                      FontVariation.width(128),
                      FontVariation.weight(500),
                    ],
                  ),
                ),
                // SizedBox(height: 500,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TileSec extends StatelessWidget {
  const TileSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: greyColor1, width: 1),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'UGC Cine Cite Halles',
              style: TextStyle(
                fontFamily: 'font',
                fontSize: 16,
                color: blackColor,
                fontVariations: [
                  FontVariation.opticalSize(56),
                  FontVariation.width(128),
                  FontVariation.weight(600),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '20 min',
              style: TextStyle(
                fontFamily: 'font',
                fontSize: 16,
                color: greyColor2,
                fontVariations: [
                  FontVariation.opticalSize(56),
                  FontVariation.width(128),
                  FontVariation.weight(500),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/map.png',
                  width: 24,
                  height: 24,
                ),
                SvgPicture.asset('assets/camera.svg'),
              ],
            ),
            // SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}

class WhereToRow extends StatelessWidget {
  const WhereToRow({
    super.key,
    this.onGoTap,
  });

  final void Function()? onGoTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: 1,
          color: greyColor1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24, right: 14),
                child: SvgPicture.asset('assets/location.svg'),
              ),
              const Text(
                'Where to?',
                style: TextStyle(
                  fontFamily: 'font',
                  fontSize: 16,
                  color: blackColor,
                  fontVariations: [
                    FontVariation.opticalSize(56),
                    FontVariation.width(128),
                    FontVariation.weight(500),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2, top: 2, bottom: 2),
                child: GoButton(
                  onTap: onGoTap,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BottomBlur extends StatelessWidget {
  const BottomBlur({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white.withOpacity(0),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
      height: MediaQuery.of(context).size.height * (1 / 2.1),
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFDC71),
            Color(0xFFFFC000),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Text(
              textAlign: TextAlign.center,
              'GO!',
              style: TextStyle(
                fontFamily: 'font',
                fontSize: 16,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontVariations: [
                  FontVariation.opticalSize(56),
                  FontVariation.width(110),
                  FontVariation.weight(900),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (2 / 3),
      child: Image.asset(
        'assets/map.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent, boxShadow: [
        BoxShadow(
          // color: Colors.black,
          color: Color(0x33000000),
          offset: Offset(0, 16),
          blurRadius: 40,
          spreadRadius: -6,
        ),
      ]),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: SvgPicture.asset(
                'assets/burger_menu.svg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
