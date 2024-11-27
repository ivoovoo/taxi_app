import 'package:flutter/material.dart';

import 'components/bottom_blur.dart';
import 'components/draggable_bottom_sheet.dart';
import 'components/map_view.dart';
import 'components/menu_button.dart';

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
          MapView(),
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
