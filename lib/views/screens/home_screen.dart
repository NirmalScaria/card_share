import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  ----- SECTION : PROFILE ------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('lib/assets/images/profile_picture.png'),
                    height: 55,
                    width: 55,
                  ),
                  const SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, John Don",
                        style: GoogleFonts.spaceGrotesk(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        "Welcome back",
                        style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: SvgPicture.asset("lib/assets/icons/settings.svg"),
                      onPressed: () {},
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              ),
            ),
            //  ----- SECTION : YOUR CARDS ------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your cards",
                    style: GoogleFonts.spaceGrotesk(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      SmallCard(
                        bgColor: Color(0xFF00C7BE),
                      ),
                      SmallCard(
                        bgColor: Color(0xFFE58A0A),
                      ),
                      NewCardSmall(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
