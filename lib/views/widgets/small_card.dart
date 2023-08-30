import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallCard extends StatelessWidget {
  final Color bgColor;
  const SmallCard({super.key, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return (Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
        ),
        height: 50,
        width: 80,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            Image(
              image: AssetImage(
                "lib/assets/images/visa_logo.png",
              ),
              width: 50,
            )
          ],
        )));
  }
}

class NewCardSmall extends StatelessWidget {
  const NewCardSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return (Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Color(0xFF2F7CF5),
      ),
      height: 50,
      width: 80,
      child: Center(
        child: IconButton(
            icon: SvgPicture.asset("lib/assets/icons/plus.svg"),
            onPressed: () {}),
      ),
    ));
  }
}
