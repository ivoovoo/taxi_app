import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milania_taxi/components/dotted_line_painter.dart';
import 'package:milania_taxi/components/plus_button.dart';

import '../constants.dart';
import 'button_with_title.dart';
import 'cars_row.dart';
import 'debit_card_row.dart';
import 'destinations_block.dart';

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
      child: const Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //TODO

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    LocationIconsBlock(),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: DestinationsBlock(),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    PlusButton(),
                  ],
                ),
              ),
            ),

            //TODO

            CarsRow(),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: DebitCardRow(),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWithTitle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//TODO
class LocationIconsBlock extends StatelessWidget {
  const LocationIconsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        SvgPicture.asset(
          'assets/location.svg',
          colorFilter: const ColorFilter.mode(greyColor3, BlendMode.srcIn),
        ),
        const SizedBox(
          height: 0,
        ),
        CustomPaint(
          painter: VerticalDottedLinePainter(),
          size:  const Size(1, 20),
        ),
        const SizedBox(height: 2,),
        SvgPicture.asset('assets/location.svg'),
      ],
    );
  }
}


