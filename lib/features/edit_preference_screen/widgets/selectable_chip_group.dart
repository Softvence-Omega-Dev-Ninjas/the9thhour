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
              style: GlobalTextStyle.heading2.copyWith(
                fontSize: 13,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            selected: isSelected,
            showCheckmark: false,
            selectedColor: const Color(0xFf6B34AE),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(color: Color(0xFFD8BBC7)),
            ),
            onSelected: (_) => onSelected(item),
          );
        }).toList(),
      ),
    );
  }
}
