// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/pickers/checkbox_picker.dart';
import 'package:flutter/material.dart';

import 'responsive_dialog.dart';
import '../interfaces/common_dialog_properties.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class CheckboxPickerDialog extends StatefulWidget
    implements ICommonDialogProperties {
  CheckboxPickerDialog({
    this.title,
    required this.items,
    required this.values,
    required this.initialValues,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.confirmText,
    this.cancelText,
  });

  // Variables
  final List<String> items;
  final List<String> values;
  final List<String>? initialValues;
  @override
  final String? title;
  @override
  final Color? headerColor;
  @override
  final Color? headerTextColor;
  @override
  final Color? backgroundColor;
  @override
  final Color? buttonTextColor;
  @override
  final double? maxLongSide;
  @override
  final double? maxShortSide;
  @override
  final String? confirmText;
  @override
  final String? cancelText;

  @override
  State<CheckboxPickerDialog> createState() =>
      _CheckboxPickerDialogState(initialValues);
}

class _CheckboxPickerDialogState extends State<CheckboxPickerDialog> {
  _CheckboxPickerDialogState(List<String>? initialValues) {
    // make a shallow copy so we don't modify the original list
    selectedValues = (initialValues == null)
        ? List<String>.empty(growable: true)
        : List<String>.from(initialValues);
  }

  late List<String> selectedValues;

  @override
  Widget build(BuildContext context) {
    return ResponsiveDialog(
      context: context,
      title: widget.title,
      headerColor: widget.headerColor,
      headerTextColor: widget.headerTextColor,
      backgroundColor: widget.backgroundColor,
      buttonTextColor: widget.buttonTextColor,
      maxLongSide: widget.maxLongSide,
      maxShortSide: widget.maxLongSide,
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      child: CheckboxPicker(
        items: widget.items,
        values: widget.values,
        selectedValues: selectedValues,
      ),
      okPressed: () => Navigator.of(context).pop(selectedValues),
    );
  }
}
