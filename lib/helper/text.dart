import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? content;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxlines;

  const CustomText(
      {Key? key,
      this.content,
      this.size,
      this.color = Colors.white,
      this.weight,
      this.align,
      this.overflow,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content!,
      style: GoogleFonts.nunito(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
      textAlign: align,
      overflow: overflow,
      maxLines: maxlines,
    );
  }
}
