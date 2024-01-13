import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleGenre extends StatelessWidget {
  final bool isSelected;
  final String genreName;

  const CircleGenre({
    Key? key,
    required this.isSelected,
    required this.genreName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 38.0,
      backgroundColor: isSelected ? Colors.black : const Color(0XFFEBEBEB),
      child: CircleAvatar(
        radius: 36.0,
        backgroundColor: Colors.white,
        child: Text(
          genreName,
          style: GoogleFonts.mulish(fontSize: 10),
        ),
      ),
    );
  }
}
