import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/color_manager.dart';
import 'package:movie_app/presentation/manager/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.prefixIcon,
    this.hint,
    this.suffixIcon,
    this.onChange,
    this.isObscureText,
    this.controller,
    this.errorText,
    this.validator,
    this.textInputType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final String? hint;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s80,
      padding: const EdgeInsets.fromLTRB(
          AppSize.s18, AppSize.s10, AppSize.s18, AppSize.s14),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: SizedBox(width: AppSize.s50, child: prefixIcon),
          hintText: hint,
          hintStyle:
              const TextStyle(color: ColorManager.grey, fontFamily: 'Poppins'),
          suffixIcon: suffixIcon,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 24, minWidth: 24),
        ),
        onChanged: onChange,
        obscureText: isObscureText ?? false,
      ),
    );
  }
}
