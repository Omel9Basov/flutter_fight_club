import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';

import 'package:flutter_fight_club/widgets/fight_result_widget.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FightClubColors.background,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Text(
                'Statistics',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24, color: FightClubColors.darkGreyText),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 16,
                ),
                child: SecondaryActionButton(
                  text: 'Back',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
