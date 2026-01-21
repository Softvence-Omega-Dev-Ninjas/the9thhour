import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';

class SelectableChipGroup extends StatelessWidget {
  final List<String> options;
  final RxString selectedValue;
  final Function(String) onSelected;

  const SelectableChipGroup({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        spacing: 6,
        runSpacing: 4,
        children: options.map((item) {
          final isSelected = selectedValue.value == item;
          return ChoiceChip(
            label: Text(
              item,
              style: GlobalTextStyle.heading2.copyWith(fontSize: 13),
            ),
            selected: isSelected,
            showCheckmark: false,
            selectedColor: Colors.deepPurple,
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(color: Colors.transparent),
            ),
            onSelected: (_) => onSelected(item),
          );
        }).toList(),
      ),
    );
  }
}
