// const/list.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


List<Item> filteredItems = [];

List<Item> result = [];

// List<String> categories = ['All', 'Plumber', 'Electrician', 'Mechanic'];
List<String> rating = ['ALL','0 - 1', '1 - 2', '2 - 3', '3 - 4','4 - 5'];

class Item {
  final String name;
  final String category;
  final double rating;
  final int reviews;

  Item(
      {required this.name,
        required this.rating,
        required this.reviews,
        required this.category});
}

String selectedCategory = 'All';

final anekDevanagariBold = GoogleFonts.anekDevanagari(
  fontWeight: FontWeight.bold,
);
final anekDevanagariNormal = GoogleFonts.anekDevanagari(
  fontWeight: FontWeight.normal,
);
final anekDevanagariMedium = GoogleFonts.anekDevanagari(
  fontWeight: FontWeight.w500,
);

final ibmPlexSansBold = GoogleFonts.ibmPlexSans(
  fontWeight: FontWeight.bold,
);

final robotoW400 =GoogleFonts.roboto(
    fontWeight: FontWeight.w400
);

final robotoW500 =GoogleFonts.roboto(
    fontWeight: FontWeight.w500
);

final robotoW600 =GoogleFonts.roboto(
    fontWeight: FontWeight.w600
);

final robotoW700 =GoogleFonts.roboto(
    fontWeight: FontWeight.w700
);




final ibmPlexSansMedium = GoogleFonts.ibmPlexSans(
  fontWeight: FontWeight.w500,
);
final ibmPlexSansNormal = GoogleFonts.ibmPlexSans(
  fontWeight: FontWeight.normal,
);