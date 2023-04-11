part of theme;

class AppTextStyle {
  static TextStyle fontWeight400(
          {double fontSize = 16,
          double height = 23 / 18,
          Color color = AppColor.addictBlack}) =>
      TextStyle(
        fontSize: fontSize,
        height: height,
        fontWeight: FontWeight.w400,
        fontFamily: AppFont.fontRegular,
        color: color,
        fontStyle: FontStyle.normal,
      );
  static TextStyle fontWeight500(
          {double fontSize = 16,
          double height = 23 / 18,
          Color color = AppColor.addictBlack}) =>
      TextStyle(
        fontSize: fontSize,
        height: height,
        fontWeight: FontWeight.w500,
        fontFamily: AppFont.fontMedium,
        color: color,
        fontStyle: FontStyle.normal,
      );
}
