// ignore_for_file: unnecessary_null_comparison, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class Custom_MonthYearPicker extends StatefulWidget {
  const Custom_MonthYearPicker({super.key});

  @override
  State<Custom_MonthYearPicker> createState() => _Custom_MonthYearPickerState();
}

int yearNow = DateTime.now().year;

class _Custom_MonthYearPickerState extends State<Custom_MonthYearPicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var selectedDate =
          ref.watch(riverpod_instance.selectedDateMonthYearPicker) ??
              DateTime.now();
      var selectedMonth = 
          ref.watch(riverpod_instance.selectedMonthMonthYearPicker);
      var selectedYear =
          ref.watch(riverpod_instance.selectedYearMonthYearPicker);
      return Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () async {
              final selected = await showMonthYearPicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(yearNow - 10),
                lastDate: DateTime(yearNow + 10),
                locale: const Locale('vi', 'VN'),
              );
              if (selected != null) {
                // setState(() {
                //   selectedDate = selected;
                //   selectedMonth = convertMonth(selectedDate!.month);
                //   selectedYear = selectedDate!.year.toString();
                // });
                ref
                    .read(
                        riverpod_instance.selectedDateMonthYearPicker.notifier)
                    .state = selected;
                ref
                    .read(
                        riverpod_instance.selectedMonthMonthYearPicker.notifier)
                    .state = convertMonth(selected.month);
                ref
                    .read(
                        riverpod_instance.selectedYearMonthYearPicker.notifier)
                    .state = selected.year.toString();
              }
            },
            child: Text('Tháng $selectedMonth năm $selectedYear'),

            // Wrap(
            //   children: [
            //     const Icon(Icons.calendar_month_outlined),
            //     SizedBox(width: 1,),
            //     Text('Tháng $selectedMonth năm $selectedYear'),
            //   ],
            // )
          ),
          const SizedBox(
            height: 5,
          )
        ],
      );
    });
  }
}
