import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                        "Hey, John Doe",
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
            ),
            // ----- SECTION : SEARCH CARDS ------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "searchTitle",
                    child: Text(
                      "Search cards",
                      style: GoogleFonts.spaceGrotesk(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "searchBox",
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: "Start typing card name",
                          hintStyle: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          suffixIcon: const Icon(Icons.search),
                          suffixIconColor:
                              Theme.of(context).colorScheme.secondary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Image(
                        image:
                            AssetImage("lib/assets/images/blob_background.png"),
                      ),
                      Column(
                        children: [
                          Text(
                            "32 Cards",
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 36,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            "Available in contacts",
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // ----- SECTION : POPULAR AMONG FRIENDS ------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular among friends",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 128,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          BigCard(
                            bankImageUrl: "lib/assets/images/icici_back.png",
                            typeImageUrl: "lib/assets/images/visa_logo.png",
                            cardBgUrl: "lib/assets/images/big_card_1.png",
                            cardTypes: "Coral | Gold | Platinum",
                          ),
                          BigCard(
                            bankImageUrl: "lib/assets/images/icici_back.png",
                            typeImageUrl: "lib/assets/images/visa_logo.png",
                            cardBgUrl: "lib/assets/images/big_card_2.png",
                            cardTypes: "Diamond | Platinum",
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
