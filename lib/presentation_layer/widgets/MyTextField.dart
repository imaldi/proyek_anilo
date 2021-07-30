import 'package:flutter/material.dart';

_defaultOnEditingComplete() {}
// _defaultOnChanged(String){}

class MyTextField extends StatefulWidget {
  MyTextField(
      {Key? key,
      this.enabled = false,
      required this.controller,
      this.style,
      this.decoration,
      this.onEditingComplete = _defaultOnEditingComplete,
      this.onChanged,
      this.inputType,
      this.validator,
      this.formKey
      // = _defaultOnChanged
      })
      : super(key: key);
  bool enabled;
  TextEditingController controller;
  void Function()? onEditingComplete;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextStyle? style;
  InputDecoration? decoration;
  TextInputType? inputType;
  Key? formKey;

  // // static _defaultOnEditingComplete(controller){}
  // static
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: widget.style,
        enabled: widget.enabled,
        controller: widget.controller,
        decoration: widget.decoration?.copyWith(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              // contentPadding: EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
            ) ??
            InputDecoration(
              // hintText: "Remark",
              // hintStyle: TextStyle(color: primaryGrey),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              // errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              // contentPadding: EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
            ),
        keyboardType: widget.inputType,
        validator: widget.validator,
        onEditingComplete: () {
          // setState(() {
          if (widget.onEditingComplete != null) {
            widget.onEditingComplete!();
          }
          FocusScope.of(context).unfocus();
          // widget.onEditingComplete!(widget.controller);
          // });
        },
        onChanged: widget.onChanged == null
            ? null
            : (currentText) {
                widget.onChanged!(currentText);
              },
      ),
    );
  }
}
