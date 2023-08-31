import 'package:card_share/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

List<Bank> getSuggestions(String entered) {
  List<Bank> suggestions = [];
  if (entered == "f" || entered == "fe") {
    suggestions.add(Bank(
        name: "The Federal Bank",
        shortLogoUrl: "lib/assets/images/bank_icons/federal_bank.png"));
    suggestions.add(Bank(
        name: "Fino Payments Bank",
        shortLogoUrl: "lib/assets/images/bank_icons/fino.png"));
  }
  return suggestions;
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool showEmpty = false;
  List<Bank> searchSuggestions = [];
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
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              showEmpty = false;
                            } else {
                              searchSuggestions = getSuggestions(value);
                              showEmpty = searchSuggestions.isEmpty;
                            }
                          });
                        },
                        controller: _searchController,
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
                if (showEmpty)
                  Container(
                      padding: const EdgeInsets.only(bottom: 15, top: 25),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              "lib/assets/icons/card_not_found.svg",
                              height: 70),
                          const SizedBox(width: 15),
                          Text(
                            "Oopsie! Bank not found\nPlease check your spelling.",
                            style: GoogleFonts.spaceGrotesk(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary),
                          )
                        ],
                      )),
                const SizedBox(height: 10),
                if (searchSuggestions.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchSuggestions.length,
                      separatorBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => CardDetailsScreen(
                          //         bank: searchSuggestions[index],
                          //       ),
                          //     ),
                          //   );
                          // },
                          leading: Image.asset(
                            searchSuggestions[index].shortLogoUrl,
                            height: 34,
                          ),
                          title: Text(
                            searchSuggestions[index].name,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      },
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
