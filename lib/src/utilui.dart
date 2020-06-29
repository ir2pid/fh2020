import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'constants.dart';

enum FontType { MIRANDA, UBUNTU }

class UtilUI {
  UtilUI(this.context, this.constants);

  BuildContext context;
  Constants constants;

  static RawMaterialButton getFabIconButton(
      BuildContext context, Constants constants, IconData icon, Color iconColor, Color bgColor, Function() fetchLocalCallback,
      {double padding, double iconSize}) {
    return RawMaterialButton(
      enableFeedback: true,
      onPressed: () => {fetchLocalCallback()},
      child: iconSize == null ? UtilUI.getIcon(icon, iconColor, constants.d36) : UtilUI.getIcon(icon, iconColor, iconSize),
      shape: CircleBorder(),
      elevation: constants.dElevation,
      fillColor: bgColor,
      padding: padding == null ? constants.dPadding16 : padding,
    );
  }

  static ButtonTheme getButton(BuildContext context, Constants constants, String name, Function fetchLocalCallback, {Color color, width = 0, height = 0}) {
    return ButtonTheme(
      //minWidth: width == 0 ? constants.d200 : width,
      //height: height == 0 ? constants.d48 : height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(constants.dRadius),
        ),
        onPressed: () {
          fetchLocalCallback();
        },
        color: color == null ? Theme.of(context).primaryColorLight : color,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: constants.d8,
            ),
            Text(
              name,
              style: TextStyle(
                color: constants.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  static RaisedButton getColorScaffold(BuildContext context, Constants constants, Color color, Widget widget) {
    var scaffold = RaisedButton(
      padding: constants.dPadding1,
      onPressed: null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constants.dRadius),
        side: BorderSide(color: color),
      ),
      disabledColor: Theme.of(context).primaryColor,
      child: widget,
    );
    return scaffold;
  }

  static IconButton getIconButton(BuildContext context, Constants constants, IconData icon, Color iconColor, Color bgColor, Function() fetchLocalCallback,
      {double padding, double iconSize, bool isElevated = true, feedback = true}) {
    return IconButton(
        enableFeedback: feedback,
        icon: Icon(icon),
        color: iconColor,
        highlightColor: bgColor,
        padding: padding == null ? EdgeInsets.all(constants.dPadding16) : EdgeInsets.all(padding),
        onPressed: () {
          fetchLocalCallback();
        });
  }

  static Widget getIcon(IconData icon, Color color, double size, {Function callback}) {
    return GestureDetector(
        onTap: () {
          if (callback != null) callback();
        },
        child: Icon(
          icon,
          color: color,
          size: size,
        ));
  }

  static Padding getCodeField(Constants constants, String codeDescription, String codeHeader, String loginHint, TextEditingController myController) {
    return Padding(
      padding: new EdgeInsets.fromLTRB(constants.dPadding16, constants.dPadding1, constants.dPadding16, constants.dPadding1),
      child: TextFormField(
        controller: myController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textCapitalization: TextCapitalization.characters,
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(constants.dRadius),
            borderSide: BorderSide(color: constants.orange, width: constants.d2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(constants.dRadius),
          ),
          prefixIcon: Icon(
            Icons.touch_app,
            color: constants.grey,
          ),
          helperText: codeDescription,
          labelText: codeHeader,
          labelStyle: TextStyle(color: constants.orange),
          hintText: loginHint,
        ),
      ),
    );
  }

  static getTextHeader(String text, Constants constants, Color color) {
    return getText(text, constants.fHeader24, color);
  }

  static getTextTitle(String text, Constants constants, Color color) {
    return getText(text, constants.fHeader16, color);
  }

  static getTextDescription(String text, Constants constants) {
    return getText(text, constants.fHeader12, constants.grey, maxLines: 3);
  }

  static getText(String text, double fontSize, Color color,
      {FontWeight fontWeight = FontWeight.w300,
      TextAlign textAlign = TextAlign.center,
      textOverflow = TextOverflow.ellipsis,
      maxLines = 1,
      FontType fontType = FontType.UBUNTU}) {
    TextStyle style = getTextStyle(color, fontSize, textAlign: textAlign, fontWeight: fontWeight, fontType: fontType);
    return Text(
      text,
      textAlign: textAlign,
      style: style,
      softWrap: true,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }

  static getTextField(TextEditingController textEditingController, double fontSize, Color color, String hintText, errorValidate,
      {obscureText = false,
      selectionEnabled = false,
      clearEnabled = false,
      labelText,
      showCursor = true,
      copy = true,
      cut = true,
      paste = true,
      selectAll = true,
      border = false,
      borderRadius = 0.0,
      textInputAction = TextInputAction.done,
      FontWeight fontWeight = FontWeight.w300,
      TextAlign textAlign = TextAlign.center,
      keyboardType: TextInputType.text,
      textOverflow = TextOverflow.ellipsis,
      maxLines = 1,
      textStyle}) {
    TextStyle style = textStyle == null ? getTextStyle(color, fontSize, textAlign: textAlign, fontWeight: fontWeight) : textStyle;

    return TextField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      toolbarOptions: ToolbarOptions(copy: copy, cut: cut, paste: paste, selectAll: selectAll),
      enableInteractiveSelection: selectionEnabled,
      obscureText: obscureText,
      showCursor: showCursor,
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: border
              ? OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius - 5.0)), borderSide: BorderSide(color: color))
              : InputBorder.none,
          border: border
              ? OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius)), borderSide: BorderSide(color: color))
              : InputBorder.none,
          hintText: hintText,
          suffixIcon: clearEnabled
              ? IconButton(
                  color: color,
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    textEditingController.clear();
                  })
              : null,
          errorText: errorValidate == null ? null : errorValidate(textEditingController.text)),
      textAlign: textAlign,
      style: style,
      maxLines: maxLines,
    );
  }

  static getTextFieldDescription(TextEditingController textEditingController, double fontSize, Color color, String hintText,
      {FontWeight fontWeight = FontWeight.w300, TextAlign textAlign = TextAlign.center, textOverflow = TextOverflow.ellipsis, maxLines = 1}) {
    TextStyle textStyle = getTextStyle(color, fontSize, textAlign: textAlign, fontWeight: fontWeight);
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      controller: textEditingController,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLines,
    );
  }

  static TextStyle getTextStyle(Color color, double fontSize,
      {FontWeight fontWeight = FontWeight.w300,
      TextAlign textAlign = TextAlign.center,
      FontType fontType = FontType.UBUNTU,
      decoration = TextDecoration.none}) {
    switch (fontType) {
      case FontType.UBUNTU:
        {
          return TextStyle(fontFamily: 'Ubuntu', fontSize: fontSize, fontWeight: fontWeight, fontStyle: FontStyle.normal, color: color, decoration: decoration);
        }
      case FontType.MIRANDA:
        {
          return TextStyle(
              fontFamily: 'Merienda', fontSize: fontSize, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, color: color, decoration: decoration);
        }
      default:
        {
          return TextStyle(fontFamily: 'Ubuntu', fontSize: fontSize, fontWeight: fontWeight, fontStyle: FontStyle.normal, color: color, decoration: decoration);
        }
    }
  }

  static getTextH1(String text, Constants constants, Color color) {
    return UtilUI.getText(text, constants.fHeader24, color, fontWeight: FontWeight.w800);
  }

  static getTextH2(String text, Constants constants, Color color) {
    return UtilUI.getText(text, constants.fHeader16, color, fontWeight: FontWeight.w600);
  }

  static getTextH3(String text, Constants constants, Color color) {
    return UtilUI.getText(text, constants.fHeader12, color, fontWeight: FontWeight.w400);
  }

  static getCircleButton(Function function) {
    return Material(
        child: Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigoAccent, width: 4.0),
        color: Colors.indigo[900],
        shape: BoxShape.circle,
      ),
      child: InkWell(
        //This keeps the splash effect within the circle
        borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
        onTap: function,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.message,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }

  static getHero(Constants constants, String tag, double size, Widget child) {
    return Hero(
      tag: tag,
      child: Container(
        width: size,
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(constants.dRadius),
          child: child,
        ),
      ),
    );
  }

  static getSvg(String assetName, {Color color}) {
    return SvgPicture.asset(
      assetName,
      color: color,
    );
  }

  static getLottie(String anim) {
    return Lottie.asset(anim);
  }
}
