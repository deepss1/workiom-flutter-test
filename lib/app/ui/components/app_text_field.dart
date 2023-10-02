// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workiom/app/data/config/app_font_style.dart';

import '../../data/config/config.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.name,
    Key? key,
    required this.title,
    this.suffixIcon,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.obSecureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.controller,
    this.textCapitalization,
    this.autofillHints,
  }) : super(key: key);

  /// form builder name
  final String name;
  final String title;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool obSecureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final Iterable<String>? autofillHints;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppFontStyles.rubik(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.k0E0F12,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              prefix ?? const SizedBox.shrink(),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: name,
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (String? value) {
                    validator?.call(value);
                    onChanged?.call(value);
                  },
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  autofillHints: autofillHints,
                  obscuringCharacter: '*',
                  cursorColor: AppColors.k000000,
                  validator: validator,
                  obscureText: obSecureText,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 100,
                    ),
                    hintText: hintText,
                    hintStyle: AppFontStyles.rubik(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.k555555,
                    ),
                    suffixIcon: suffixIcon,
                    suffix: suffix,
                    prefixIcon: prefixIcon,
                    isDense: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kD6D6D6),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kD6D6D6),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kD6D6D6),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
