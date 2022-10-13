import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class TextFormUpdated extends StatelessWidget {
  final TextEditingController? controller;
  final double? radius;
  final String? hintText;
  final String? fieldName;
  final TextStyle? fieldNameStyle;
  final String? fieldPostRedirection;
  final TextStyle? fieldPostRedirectionStyle;
  final VoidCallback? postFieldOnClick;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final Widget? suffixChildActive;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final bool? error;
  final bool? filled;
  final String? errorMessage;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final BoxConstraints? prefixChildBoxConstraint;
  final BoxConstraints? suffixChildBoxConstraint;
  final Widget? suffixChild;
  final Widget? prefixChild;
  final TextInputAction? textInputAction;
  final bool? obscuringText;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final Color? cursorColor;

  //SELECT FORM
  final String? value;
  final IconData? icon;
  final double? iconSize;
  final List<DropdownMenuItem<Object>>? items;
  final Function(Object?)? onChangedSelect;
  final double? radiusDropDown;

  //DATE FORM
  final Function(DateTime?)? onChangedDate;
  final Function(DateTime?)? onSavedDate;
  final String? Function(DateTime?)? validatorDate;
  final DateTime? defaultDate;

  //PHONE FORM
  final Function(PhoneNumber)? onInputChanged;
  final PhoneNumber? initialPhoneValue;

  //CLASSIC FORM
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? defaultValue;
  final Function(String)? onChanged;
  final bool? isUpdatable;
  final double? minLine;
  final double? maxLine;

  const TextFormUpdated({
    this.focusNode,
    this.controller,
    this.fieldName,
    this.hintText,
    this.isUpdatable,
    this.radius,
    this.contentPadding,
    this.suffixChildActive,
    this.fieldNameStyle,
    this.hintTextStyle,
    this.textStyle,
    this.backgroundColor,
    this.cursorColor,
    this.error,
    this.filled,
    this.errorMessage,
    this.fieldPostRedirection,
    this.postFieldOnClick,
    this.nextFocusNode,
    this.prefixChildBoxConstraint,
    this.suffixChildBoxConstraint,
    this.suffixChild,
    this.prefixChild,
    this.textInputAction,
    this.obscuringText,
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusedErrorBorder,
    this.errorBorder,
    this.focusedBorder,
    this.border,
    this.fieldPostRedirectionStyle,

    //SELECT FORM
    this.icon,
    this.iconSize,
    this.items,
    this.onChangedSelect,
    this.value,
    this.radiusDropDown,

    //DATE FORM
    this.onChangedDate,
    this.onSavedDate,
    this.validatorDate,
    this.defaultDate,

    //PHONE FORM
    this.onInputChanged,
    this.initialPhoneValue,

    //CLASSIC FORM
    this.inputFormatters,
    this.textInputType,
    this.defaultValue,
    this.onChanged,
    this.minLine,
    this.maxLine,
    Key? key,
  }) : super(key: key);

  const factory TextFormUpdated.classic({
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final Widget? suffixChildActive,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? isUpdatable,
    final bool? filled,
    final String? Function(String?)? validator,
    final Function(String)? onFieldSubmitted,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final VoidCallback? postFieldOnClick,
    final TextStyle? fieldPostRedirectionStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final TextEditingController? controller,
    final List<TextInputFormatter>? inputFormatters,
    final TextInputType? textInputType,
    final String? defaultValue,
    final Function(String)? onChanged,
  }) = _Classic;

  const factory TextFormUpdated.phoneNumber({
    final PhoneNumber? initialPhoneValue,
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final VoidCallback? postFieldOnClick,
    final TextStyle? fieldPostRedirectionStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final Function(PhoneNumber)? onInputChanged,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final TextEditingController? controller,
  }) = _PhoneNumber;

  const factory TextFormUpdated.dateTime({
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final VoidCallback? postFieldOnClick,
    final TextStyle? fieldPostRedirectionStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final Function(String)? onFieldSubmitted,
    final Function(DateTime?)? onChangedDate,
    final Function(DateTime?)? onSavedDate,
    final String? Function(DateTime?)? validatorDate,
    final DateTime? defaultDate,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final TextEditingController? controller,
  }) = _DateTime;

  factory TextFormUpdated.immatriculation({
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final TextStyle? fieldPostRedirectionStyle,
    final VoidCallback? postFieldOnClick,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final String? Function(String?)? validator,
    final Function(String?)? onSaved,
    final Function(String)? onFieldSubmitted,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final String? defaultValue,
    final void Function(String?)? onChanged,
  }) = _Immatriculation;

  const factory TextFormUpdated.textarea({
    final String? fieldName,
    final TextStyle? fieldNameStyle,
    final String? hintText,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final Function(String)? onChanged,
    final TextEditingController? controller,
    final Widget? prefixChild,
    final Widget? suffixChild,
    final bool? error,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final bool? filled,
    final Color? backgroundColor,
    final EdgeInsetsGeometry? contentPadding,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final Color? cursorColor,
    final String? initialValue,
    final double? maxLine,
    final double? minLine,
    final String? Function(String?)? validator,
  }) = _TextArea;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Classic extends TextFormUpdated {
  const _Classic({
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final bool? isUpdatable,
    final String? fieldPostRedirection,
    final VoidCallback? postFieldOnClick,
    final void Function(String)? onFieldSubmitted,
    final TextStyle? fieldPostRedirectionStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final String? Function(String?)? validator,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final TextEditingController? controller,
    final List<TextInputFormatter>? inputFormatters,
    final TextInputType? textInputType,
    final String? defaultValue,
    final Widget? suffixChildActive,
    final Function(String)? onChanged,
  }) : super(
          inputFormatters: inputFormatters,
          textInputType: textInputType,
          defaultValue: defaultValue,
          onChanged: onChanged,
          controller: controller,
          fieldName: fieldName,
          cursorColor: cursorColor,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          border: border,
          error: error,
          errorMessage: errorMessage,
          fieldPostRedirectionStyle: fieldPostRedirectionStyle,
          fieldPostRedirection: fieldPostRedirection,
          postFieldOnClick: postFieldOnClick,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
          isUpdatable: isUpdatable,
          suffixChildActive: suffixChildActive,
          nextFocusNode: nextFocusNode,
          prefixChildBoxConstraint: prefixChildBoxConstraint,
          suffixChildBoxConstraint: suffixChildBoxConstraint,
          suffixChild: suffixChild,
          prefixChild: prefixChild,
          textInputAction: textInputAction,
          obscuringText: obscuringText,
          filled: filled,
          validator: validator,
          backgroundColor: backgroundColor,
          hintText: hintText,
          radius: radius,
          contentPadding: contentPadding,
          fieldNameStyle: fieldNameStyle,
          hintTextStyle: hintTextStyle,
          textStyle: textStyle,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            (error ?? false) && (errorMessage != null)
                ? Text(
                    errorMessage ?? "",
                    style: fieldNameStyle?.copyWith(color: Colors.red) ??
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                  )
                : fieldName != null
                    ? Text(
                        fieldName!,
                        style: fieldNameStyle ??
                            TextStyle(color: AppColor.primaryColor, fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    : Container(),
            fieldPostRedirection == null ? const SizedBox() : const Spacer(),
            fieldPostRedirection == null
                ? const SizedBox()
                : InkWell(
                    onTap: postFieldOnClick,
                    child: Text(
                      fieldPostRedirection!,
                      style: fieldPostRedirectionStyle ??
                          TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                    )),
          ],
        ),
        SizedBox(height: 7.h),
        TextFormField(
          textInputAction: textInputAction,
          validator: validator,
          keyboardType: textInputType,
          focusNode: focusNode,
          onChanged: onChanged,
          onSaved: onSaved,
          onFieldSubmitted: (String val) {
            if (onFieldSubmitted != null) onFieldSubmitted!(val);
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          inputFormatters: inputFormatters,
          obscureText: obscuringText ?? false,
          controller: controller,
          obscuringCharacter: '*',
          initialValue: controller == null ? defaultValue : null,
          style: textStyle ??
              TextStyle(color: AppColor.primaryColor, fontSize: 13, fontWeight: FontWeight.w500)
                  .copyWith(color: AppColor.primaryColor),
          cursorColor: cursorColor ?? AppColor.primaryColor,
          decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 12, height: 0),
              prefixIcon: prefixChild,
              suffixIcon: suffixChild,
              prefixIconConstraints: prefixChildBoxConstraint,
              suffixIconConstraints: suffixChildBoxConstraint,
              filled: filled ?? true,
              fillColor: backgroundColor ?? const Color(0xFF02132B).withOpacity(0.03),
              contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
              focusedErrorBorder: focusedErrorBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 0.5,
                      )),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 0.5,
                      )),
              focusedBorder: focusedBorder,
              border:
                  border ?? UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
              hintText: hintText ?? "Placeholder",
              hintStyle: hintTextStyle ??
                  const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}

class _PhoneNumber extends TextFormUpdated {
  const _PhoneNumber({
    final PhoneNumber? initialPhoneValue,
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final VoidCallback? postFieldOnClick,
    final TextStyle? fieldPostRedirectionStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final Function(PhoneNumber)? onInputChanged,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final TextEditingController? controller,
  }) : super(
          initialPhoneValue: initialPhoneValue,
          controller: controller,
          onInputChanged: onInputChanged,
          fieldName: fieldName,
          cursorColor: cursorColor,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          border: border,
          error: error,
          errorMessage: errorMessage,
          fieldPostRedirectionStyle: fieldPostRedirectionStyle,
          fieldPostRedirection: fieldPostRedirection,
          postFieldOnClick: postFieldOnClick,
          focusNode: focusNode,
          nextFocusNode: nextFocusNode,
          prefixChildBoxConstraint: prefixChildBoxConstraint,
          suffixChildBoxConstraint: suffixChildBoxConstraint,
          suffixChild: suffixChild,
          prefixChild: prefixChild,
          textInputAction: textInputAction,
          obscuringText: obscuringText,
          filled: filled,
          backgroundColor: backgroundColor,
          hintText: hintText,
          radius: radius,
          contentPadding: contentPadding,
          fieldNameStyle: fieldNameStyle,
          hintTextStyle: hintTextStyle,
          textStyle: textStyle,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            (error ?? false)
                ? Text(
                    "Format téléphone invalide",
                    style: fieldNameStyle?.copyWith(color: Colors.red) ??
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                  )
                : Text(
                    fieldName ?? "",
                    style: fieldNameStyle ??
                        const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500),
                  ),
            fieldPostRedirection == null ? const SizedBox() : const Spacer(),
            fieldPostRedirection == null
                ? const SizedBox()
                : InkWell(
                    onTap: postFieldOnClick,
                    child: Text(
                      fieldPostRedirection ?? "",
                      style: fieldPostRedirectionStyle ??
                          const TextStyle(
                            color: Color(0xFF02132B),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 7),
        InternationalPhoneNumberInput(
          autoValidateMode: AutovalidateMode.always,
          initialValue: initialPhoneValue ?? PhoneNumber(isoCode: 'FR', dialCode: '33'),
          focusNode: focusNode,
          onFieldSubmitted: (String? value) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          onInputChanged: onInputChanged,
          spaceBetweenSelectorAndTextField: 0,
          selectorConfig: const SelectorConfig(
            setSelectorButtonAsPrefixIcon: true,
            showFlags: true,
            useEmoji: true,
            leadingPadding: 15,
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          inputDecoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 12, height: 0),
            prefixIcon: prefixChild,
            suffixIcon: error ?? false
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      suffixChild ?? const SizedBox(),
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 28,
                      ),
                      const SizedBox(width: 13)
                    ],
                  )
                : suffixChild,
            prefixIconConstraints: prefixChildBoxConstraint,
            suffixIconConstraints: suffixChildBoxConstraint,
            filled: filled ?? true,
            fillColor: backgroundColor ?? const Color(0xFF02132B).withOpacity(0.03),
            contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
            focusedErrorBorder: focusedErrorBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                    )),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 0.5,
                    )),
            focusedBorder: focusedBorder,
            border: border ?? UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            hintText: hintText ?? "6 00 00 00 00",
            hintStyle:
                hintTextStyle ?? const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500),
          ),
          ignoreBlank: true,
          textStyle: textStyle ?? const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500),
          selectorTextStyle:
              textStyle ?? const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500),
          errorMessage: "Format téléphone invalide",
          textFieldController: controller,
          formatInput: true,
          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: const OutlineInputBorder(),
        ),
      ],
    );
  }
}

class _DateTime extends TextFormUpdated {
  const _DateTime({
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final VoidCallback? postFieldOnClick,
    final TextStyle? fieldPostRedirectionStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final Function(String)? onFieldSubmitted,
    final Function(DateTime?)? onChangedDate,
    final Function(DateTime?)? onSavedDate,
    final String? Function(DateTime?)? validatorDate,
    final DateTime? defaultDate,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final TextEditingController? controller,
  }) : super(
          controller: controller,
          onChangedDate: onChangedDate,
          onSavedDate: onSavedDate,
          validatorDate: validatorDate,
          defaultDate: defaultDate,
          fieldName: fieldName,
          cursorColor: cursorColor,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          border: border,
          error: error,
          errorMessage: errorMessage,
          fieldPostRedirectionStyle: fieldPostRedirectionStyle,
          fieldPostRedirection: fieldPostRedirection,
          postFieldOnClick: postFieldOnClick,
          focusNode: focusNode,
          nextFocusNode: nextFocusNode,
          prefixChildBoxConstraint: prefixChildBoxConstraint,
          suffixChildBoxConstraint: suffixChildBoxConstraint,
          suffixChild: suffixChild,
          prefixChild: prefixChild,
          textInputAction: textInputAction,
          obscuringText: obscuringText,
          onFieldSubmitted: onFieldSubmitted,
          filled: filled,
          backgroundColor: backgroundColor,
          hintText: hintText,
          radius: radius,
          contentPadding: contentPadding,
          fieldNameStyle: fieldNameStyle,
          hintTextStyle: hintTextStyle,
          textStyle: textStyle,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            (error ?? false)
                ? Text(
                    "Format date invalide",
                    style: fieldNameStyle?.copyWith(color: Colors.red) ??
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                  )
                : Text(
                    fieldName ?? "",
                    style: fieldNameStyle ??
                        const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500),
                  ),
            fieldPostRedirection == null ? const SizedBox() : const Spacer(),
            fieldPostRedirection == null
                ? const SizedBox()
                : InkWell(
                    onTap: postFieldOnClick,
                    child: Text(
                      fieldPostRedirection ?? "",
                      style: fieldPostRedirectionStyle ??
                          const TextStyle(
                            color: Color(0xFF02132B),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 7),
        DateTimeField(
          format: DateFormat("dd/MM/yyyy"),
          controller: controller,
          onShowPicker: (context, currentValue) async {
            return await showDatePicker(
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Color(0xFF033323),
                      onPrimary: Colors.white,
                      onSurface: Color(0xFF033323),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF033323),
                      ),
                    ),
                  ),
                  child: child ?? const SizedBox(),
                );
              },
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              initialDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
              initialDatePickerMode: DatePickerMode.day,
              firstDate: DateTime(DateTime.now().year - 150),
              lastDate: DateTime(DateTime.now().year + 1),
            );
          },
          onChanged: onChangedDate,
          onSaved: onSavedDate,
          onFieldSubmitted: (DateTime? date) {
            onFieldSubmitted ?? onFieldSubmitted!(date.toString());
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          focusNode: focusNode,
          textInputAction: textInputAction,
          validator: validatorDate,
          obscureText: obscuringText ?? false,
          initialValue: controller == null ? defaultDate : null,
          style: textStyle ??
              const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500)
                  .copyWith(color: const Color(0xFF02132B)),
          decoration: InputDecoration(
            prefixIcon: prefixChild,
            suffixIcon: error ?? false
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      suffixChild ?? const SizedBox(),
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 28,
                      ),
                      const SizedBox(width: 13),
                    ],
                  )
                : suffixChild,
            prefixIconConstraints: prefixChildBoxConstraint,
            suffixIconConstraints: suffixChildBoxConstraint,
            filled: filled ?? true,
            fillColor: backgroundColor ?? const Color(0xFF02132B).withOpacity(0.03),
            contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
            focusedErrorBorder: focusedErrorBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                    )),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 0.5,
                    )),
            focusedBorder: focusedBorder,
            border: border ?? UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            hintText: hintText ?? "00/00/0000",
            hintStyle:
                hintTextStyle ?? const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class _Immatriculation extends TextFormUpdated {
  final FocusNode form0Node = FocusNode();
  final FocusNode form1Node = FocusNode();
  final FocusNode form2Node = FocusNode();

  final TextEditingController form0Controller = TextEditingController();
  final TextEditingController form2Controller = TextEditingController();
  final TextEditingController form1Controller = TextEditingController();

  _Immatriculation({
    final String? fieldName,
    final Color? backgroundColor,
    final Color? cursorColor,
    final String? hintText,
    final double? radius,
    final EdgeInsets? contentPadding,
    final TextStyle? fieldNameStyle,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final bool? error,
    final bool? filled,
    final String? errorMessage,
    final String? fieldPostRedirection,
    final TextStyle? fieldPostRedirectionStyle,
    final VoidCallback? postFieldOnClick,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final Widget? suffixChild,
    final Widget? prefixChild,
    final TextInputAction? textInputAction,
    final bool? obscuringText,
    final String? Function(String?)? validator,
    final Function(String?)? onSaved,
    final Function(String)? onFieldSubmitted,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final String? defaultValue,
    final void Function(String?)? onChanged,
  }) : super(
          fieldName: fieldName,
          fieldPostRedirectionStyle: fieldPostRedirectionStyle,
          cursorColor: cursorColor,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          border: border,
          error: error,
          errorMessage: errorMessage,
          fieldPostRedirection: fieldPostRedirection,
          postFieldOnClick: postFieldOnClick,
          focusNode: focusNode,
          nextFocusNode: nextFocusNode,
          prefixChildBoxConstraint: prefixChildBoxConstraint,
          suffixChildBoxConstraint: suffixChildBoxConstraint,
          suffixChild: suffixChild,
          prefixChild: prefixChild,
          textInputAction: textInputAction,
          obscuringText: obscuringText,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          filled: filled,
          backgroundColor: backgroundColor,
          hintText: hintText,
          radius: radius,
          contentPadding: contentPadding,
          fieldNameStyle: fieldNameStyle,
          hintTextStyle: hintTextStyle,
          textStyle: textStyle,
          onChanged: onChanged,
          defaultValue: defaultValue,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            (error ?? false) && (errorMessage != null)
                ? Text(
                    errorMessage ?? "",
                    style: fieldNameStyle?.copyWith(color: Colors.red) ??
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                  )
                : fieldName != null
                    ? Text(
                        fieldName!,
                        style: fieldNameStyle ??
                            const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    : Container(),
            fieldPostRedirection == null ? const SizedBox() : const Spacer(),
            fieldPostRedirection == null
                ? const SizedBox()
                : InkWell(
                    onTap: postFieldOnClick,
                    child: Text(
                      fieldPostRedirection ?? "",
                      style: fieldPostRedirectionStyle ??
                          const TextStyle(
                            color: Color(0xFF02132B),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                    )),
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
        Row(
          children: [
            formTmp(
              4,
              context,
              hintText != null ? hintText!.substring(0, 2) : "00",
              focusNode ?? FocusNode(),
              false,
              (_) {
                if (onChanged != null) onChanged!(form0Controller.text + form1Controller.text + form2Controller.text);
                if (_.length >= 2) FocusScope.of(context).requestFocus(form1Node);
              },
              form0Controller,
              2,
            ),
            SizedBox(
              width: 7.h,
            ),
            formTmp(
              7,
              context,
              hintText != null ? hintText!.substring(2, 5) : "ABC",
              form1Node,
              false,
              (_) {
                if (onChanged != null) onChanged!(form0Controller.text + form1Controller.text + form2Controller.text);
                if (_.length >= 3) FocusScope.of(context).requestFocus(form2Node);
                if (_.isEmpty) FocusScope.of(context).requestFocus(focusNode);
              },
              form1Controller,
              3,
            ),
            SizedBox(
              width: 7.h,
            ),
            formTmp(
              4,
              context,
              hintText != null ? hintText!.substring(5, 7) : "00",
              form2Node,
              true,
              (_) {
                if (onChanged != null) onChanged!(form0Controller.text + form1Controller.text + form2Controller.text);
                if (_.length >= 2 && nextFocusNode != null) {
                  FocusScope.of(context).requestFocus(nextFocusNode);
                } else if (_.length >= 2) {
                  FocusScope.of(context).unfocus();
                }
                if (_.isEmpty) FocusScope.of(context).requestFocus(form1Node);
              },
              form2Controller,
              2,
            ),
          ],
        )
      ],
    );
  }

  Widget formTmp(
    int flex,
    BuildContext context,
    String? hintText_,
    FocusNode focusNode_,
    bool lastForm_,
    Function(String)? onChanged_,
    TextEditingController controller,
    int maxChar,
  ) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 54,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          textInputAction: lastForm_ ? textInputAction : null,
          validator: lastForm_ ? validator : null,
          keyboardType: TextInputType.text,
          focusNode: focusNode_,
          onChanged: onChanged_,
          inputFormatters: [LengthLimitingTextInputFormatter(maxChar)],
          onSaved: lastForm_
              ? (_) {
                  if (onSaved != null) onSaved!(form0Controller.text + form1Controller.text + form2Controller.text);
                }
              : null,
          onFieldSubmitted: lastForm_
              ? (String val) {
                  if (onFieldSubmitted != null)
                    onFieldSubmitted!(form0Controller.text + form1Controller.text + form2Controller.text);
                  FocusScope.of(context).requestFocus(nextFocusNode);
                }
              : (_) {},
          obscureText: obscuringText ?? false,
          obscuringCharacter: '*',
          style: textStyle ??
              const TextStyle(color: Color(0xFF02132B), fontSize: 13, fontWeight: FontWeight.w500)
                  .copyWith(color: const Color(0xFF02132B)),
          cursorColor: cursorColor ?? const Color(0xFF02132B),
          decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 12, height: 0),
              prefixIcon: prefixChild,
              suffixIcon: error ?? false
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        suffixChild ?? const SizedBox(),
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 28,
                        ),
                        const SizedBox(width: 13)
                      ],
                    )
                  : suffixChild,
              prefixIconConstraints: prefixChildBoxConstraint,
              suffixIconConstraints: suffixChildBoxConstraint,
              filled: filled ?? true,
              fillColor: backgroundColor ?? const Color(0xFF02132B).withOpacity(0.03),
              contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
              focusedErrorBorder: focusedErrorBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 0.5,
                      )),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 0.5,
                      )),
              focusedBorder: focusedBorder,
              border:
                  border ?? UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
              hintText: hintText_,
              // hintText: placeholder != null ? placeholder!.substring(5, 7) : "00",
              hintStyle: hintTextStyle ??
                  const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

class _TextArea extends TextFormUpdated {
  const _TextArea({
    final String? fieldName,
    final TextStyle? fieldNameStyle,
    final String? hintText,
    final TextStyle? hintTextStyle,
    final TextStyle? textStyle,
    final FocusNode? focusNode,
    final FocusNode? nextFocusNode,
    final Function(String)? onChanged,
    final TextEditingController? controller,
    final Widget? prefixChild,
    final Widget? suffixChild,
    final bool? error,
    final BoxConstraints? prefixChildBoxConstraint,
    final BoxConstraints? suffixChildBoxConstraint,
    final bool? filled,
    final Color? backgroundColor,
    final EdgeInsetsGeometry? contentPadding,
    final InputBorder? focusedErrorBorder,
    final InputBorder? errorBorder,
    final InputBorder? focusedBorder,
    final InputBorder? border,
    final Color? cursorColor,
    final String? initialValue,
    final double? maxLine,
    final double? minLine,
    final String? Function(String?)? validator,
  }) : super(
          fieldName: fieldName,
          fieldNameStyle: fieldNameStyle,
          hintText: hintText,
          hintTextStyle: hintTextStyle,
          textStyle: textStyle,
          focusNode: focusNode,
          onChanged: onChanged,
          controller: controller,
          error: error,
          defaultValue: initialValue,
          validator: validator,
          prefixChild: prefixChild,
          suffixChild: suffixChild,
          prefixChildBoxConstraint: prefixChildBoxConstraint,
          suffixChildBoxConstraint: suffixChildBoxConstraint,
          filled: filled,
          backgroundColor: backgroundColor,
          contentPadding: contentPadding,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          border: border,
          cursorColor: cursorColor,
          nextFocusNode: nextFocusNode,
          minLine: minLine,
          maxLine: maxLine,
        );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fieldName ?? "NOM FIELD",
          style: fieldNameStyle ?? const TextStyle(color: Color(0xFF02132B), fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 7.h),
        TextFormField(
          scrollPhysics: const BouncingScrollPhysics(),
          scrollPadding: EdgeInsets.zero,
          keyboardType: TextInputType.multiline,
          focusNode: focusNode,
          initialValue: defaultValue,
          maxLines: maxLine?.toInt() ?? 4,
          minLines: maxLine?.toInt(),
          onFieldSubmitted: (String val) {
            if (onFieldSubmitted != null) onFieldSubmitted!(val);
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          style: textStyle ??
              const TextStyle(color: Color(0xFF02132B), fontSize: 13, fontWeight: FontWeight.w500)
                  .copyWith(color: const Color(0xFF02132B)),
          cursorColor: cursorColor ?? const Color(0xFF02132B),
          decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 12, height: 0),
              prefixIcon: prefixChild,
              suffixIcon: error ?? false
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        suffixChild ?? const SizedBox(),
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 28,
                        ),
                        const SizedBox(width: 13)
                      ],
                    )
                  : suffixChild,
              prefixIconConstraints: prefixChildBoxConstraint,
              suffixIconConstraints: suffixChildBoxConstraint,
              filled: filled ?? true,
              fillColor: backgroundColor ?? const Color(0xFF02132B).withOpacity(0.03),
              contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
              focusedErrorBorder: focusedErrorBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 0.5,
                      )),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 0.5,
                      )),
              focusedBorder: focusedBorder,
              border:
                  border ?? UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
              hintText: hintText ?? "Placeholder",
              hintStyle: hintTextStyle ??
                  const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}

class SelectForm<T> extends StatelessWidget {
  final String? fieldName;
  final String? hintText;
  final T? value;
  final TextStyle? fieldNameStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? iconSize;
  final double? radius;
  final double? radiusDropDown;
  final IconData? icon;
  final EdgeInsetsGeometry? contentPadding;
  final List<DropdownMenuItem<T>>? items;
  final Function(T?)? onChangedSelect;
  final String? Function(T?)? validator;
  final FocusNode? focusNode;

  const SelectForm({
    this.fieldName,
    this.hintText,
    this.value,
    this.fieldNameStyle,
    this.hintTextStyle,
    this.textStyle,
    this.backgroundColor,
    this.iconSize,
    this.radius,
    this.radiusDropDown,
    this.icon,
    this.contentPadding,
    this.items,
    this.onChangedSelect,
    this.validator,
    this.focusNode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName ?? "NOM FIELD",
          textAlign: TextAlign.start,
          style: fieldNameStyle ?? TextStyle(color: AppColor.primaryColor, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 7),
        DropdownButtonFormField<T>(
          decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 12, height: 0),
              fillColor: backgroundColor ?? AppColor.primaryColor.withOpacity(0.03),
              // contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 0.5,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 0.5,
                  )),
              filled: true,
              border: UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
              hintText: hintText ?? "Placeholder",
              hintStyle: hintTextStyle ??
                  const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500)),
          focusNode: focusNode,
          borderRadius: BorderRadius.circular(radiusDropDown ?? 7),
          elevation: 8,
          hint: Text(
            hintText ?? "Sélectionner",
            style: hintTextStyle ??
                const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500)
                    .copyWith(fontFamily: 'Poppins'),
          ),
          value: value,
          iconSize: iconSize ?? 24.0,
          icon: Icon(icon ?? Iconsax.arrow_down_14),
          style: textStyle ??
              TextStyle(color: AppColor.primaryColor, fontSize: 13, fontWeight: FontWeight.w500)
                  .copyWith(color: AppColor.primaryColor, fontFamily: 'Poppins'),
          items: items ?? <DropdownMenuItem<T>>[],
          onChanged: onChangedSelect ?? (_) {},
          validator: validator,
        ),
      ],
    );
  }
}
