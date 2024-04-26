import 'package:flutter/material.dart';

class RecipeCookware extends StatelessWidget {
  const RecipeCookware({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cookwareList = [
      "Hamster-Stir Pot",
      "Chatty Pan",
      "Disco Colander",
      "Singing Spatula",
      "Giraffe Whisk",
      "Disco Oven",
      "RoboCups",
      "Magi-Pot",
      "Taste Mitts",
      "Selfie Lid"
    ];

    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: cookwareList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                      elevation: 1.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Center(
                          child: Text(
                            cookwareList[index],
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      )),
                );
              }),
        ),
      ],
    );
  }
}
