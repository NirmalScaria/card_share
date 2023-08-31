import 'package:card_share/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavbar(
        selectedIndex: 1,
        context: context,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
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
                  child: Material(
                    child: Text(
                      "Search cards",
                      style: GoogleFonts.spaceGrotesk(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: Hero(
                    tag: "searchBox",
                    child: Material(
                      child: TextField(
                        autofocus: true,
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
                ),
                const SizedBox(height: 15),
                Hero(
                  tag: "availbaleInContacts",
                  child: Material(
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image:
                            AssetImage("lib/assets/images/blob_background.png"),
                        fit: BoxFit.fill,
                      )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
