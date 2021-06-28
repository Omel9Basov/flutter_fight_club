import 'package:flutter/material.dart';
import 'package:flutter_fight_club/pages/statistics_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/resources/fight_club_images.dart';

import 'package:flutter_fight_club/widgets/action_button.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fight_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MainPageContent();
  }
}

class _MainPageContent extends StatelessWidget {
  const _MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FightClubColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Center(
                  child: Text(
                "The\nFight\nClub".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30, color: FightClubColors.darkGreyText),
              )),
              Expanded(child: SizedBox()),
              Container(
                child: SizedBox(
                  height: 160,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: ColoredBox(
                            color: Colors.white,
                          )),
                          Expanded(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.white,
                              FightClubColors.darkPurple
                            ]),
                          ))),
                          Expanded(
                              child: ColoredBox(
                            color: FightClubColors.darkPurple,
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'You',
                                style: TextStyle(
                                    color: FightClubColors.darkGreyText),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Image.asset(
                                FightClubImages.youAvatar,
                                height: 92,
                                width: 92,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 44,
                            width: 44,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: FightClubColors.blueButton),
                              child: Center(
                                child: Text(
                                  'VS',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Column(children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Text('Enemy',
                                style: TextStyle(
                                    color: FightClubColors.darkGreyText)),
                            const SizedBox(
                              height: 12,
                            ),
                            Image.asset(
                              FightClubImages.enemyAvatar,
                              height: 92,
                              width: 92,
                            )
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder<String?>(
                  future: SharedPreferences.getInstance().then(
                      (sharedPreferences) =>
                          sharedPreferences.getString("last_fight_result")),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Center(
                      child: Text(snapshot.data!),
                    );
                  }),
              Expanded(child: SizedBox()),
              SecondaryActionButton(
                  text: 'Statistics',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StatisticsPage()));
                  }),
              const SizedBox(
                height: 16,
              ),
              ActionButton(
                  text: 'Start'.toUpperCase(),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FightPage(),
                    ));
                  },
                  color: FightClubColors.blackButton),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
