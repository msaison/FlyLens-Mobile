import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////////////////////////
///////////////////////////        API KEY        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

const WEATHER_API = '5ced979135b6774c501086f1aba2b0c4';
const GOOGLE_PLACES_API = 'AIzaSyA0bcyPfJOs9KldCK-0NBXsfTaLBxdr7bE';

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
/////////////////////        MAPS LAYOUT LINKS        ////////////////////////
//////////////////////////////////////////////////////////////////////////////

const GEOMAPLINK =
    'https://wxs.ign.fr/essentiels/geoportail/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=ORTHOIMAGERY.ORTHOPHOTOS&TILEMATRIXSET=PM&TILEMATRIX={z}&TILECOL={x}&TILEROW={y}&STYLE=normal&FORMAT=image/jpeg';

const GEOMAPAGRILINK =
    'https://wxs.ign.fr/agriculture/geoportail/wmts?SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetCapabilities&LAYER=LANDUSE.AGRICULTURE2020&TILEMATRIXSET=PM&TILEMATRIX={z}&TILECOL={x}&TILEROW={y}&STYLE=normal&FORMAT=image/png';

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
//////////////////////////        APP CORE        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

const MULTIPLE_ACCOUNT_TYPE = false;

const DOES_YOUR_APP_NEED_PAYMENT = false;
/* Account type is the collection */
const ACCOUNT_TYPES = ['Particuliers', 'Professionnels'];

/* Collection name of user */
const COLLECTION_USER = 'Users';

/* Collection name of enterprise*/
const COLLECTION_ENTERPRISE = 'Enterprises';

const DOES_YOUR_APP_NEED_ONBOARDING = true;
/* ONCONNECT is the page after the connection but before the home page, it's for asking some permissions like geoloc */
const DOES_YOUR_APP_NEED_ONCONNECT = true;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
/////////////////////////        APP THEME        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

abstract class AppTheme {
  static InputDecoration inputDecoration({
    String? hintText,
  }) =>
      InputDecoration(
          errorStyle: const TextStyle(fontSize: 12, height: 0),
          filled: true,
          fillColor: const Color(0xFF02132B).withOpacity(0.03),
          contentPadding: const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: AppColor.errorColor,
                width: 0.5,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: AppColor.errorColor,
                width: 0.5,
              )),
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
          hintText: hintText ?? "Placeholder",
          hintStyle: const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500));
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
/////////////////////////        APP COLOR        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

abstract class AppColor {
  static Color backgroundColor = Color(0xFFF3F0EF);
  static Color lightprimaryColor = Color(0xFF4CA063);
  static Color primaryColor = Color(0xFF033323);
  static Color darkprimaryColor = Color.fromARGB(255, 1, 23, 16);
  static Color fiveColor = Color.fromARGB(255, 232, 227, 223);
  static Color errorColor = Color(0xFFFF3333);
  static Color successColor = Colors.green;
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////