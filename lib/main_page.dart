import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milania_taxi/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
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
            ),
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
          DraggableScrollableSheet(
              controller: controller,
              initialChildSize: 1 * (1 / 3),
              minChildSize: 1 * (1 / 3),
              maxChildSize: 1 * (1 / 1.65),
              builder: (
                ctx,
                controller,
              ) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xffDADADA),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: SvgPicture.asset('assets/location.svg'),
                                    ),
                                    Text(
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
                                      padding: const EdgeInsets.only(right: 1.0),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24),
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
                                                FontVariation.width(128),
                                                FontVariation.weight(1000),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

//COMPONENTS==================================================================

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
