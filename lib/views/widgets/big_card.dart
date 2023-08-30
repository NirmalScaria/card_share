import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigCard extends StatelessWidget {
  final String bankImageUrl;
  final String typeImageUrl;
  final String cardBgUrl;
  final String cardTypes;

  const BigCard({
    super.key,
    required this.bankImageUrl,
    required this.typeImageUrl,
    required this.cardBgUrl,
    required this.cardTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 14),
        width: 217,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(cardBgUrl),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(image: AssetImage(bankImageUrl), width: 110),
                const Spacer(),
                Image(image: AssetImage(typeImageUrl), width: 50),
              ],
            ),
            const Image(
                image: AssetImage("lib/assets/images/card_chip.png"),
                height: 29),
            Text(
              cardTypes,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ));
  }
}
