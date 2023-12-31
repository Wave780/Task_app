import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_app/providers/provider.dart';
import 'package:task_app/utils/utils.dart';
import 'package:task_app/widgets/common_text_field.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Date',
            hintText: DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
                onPressed: () => _selectDate(context, ref),
                icon: const FaIcon(FontAwesomeIcons.calendar)),
          ),
        ),
        const Gap(16),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Time',
            hintText: Helper.timeToString(time),
            suffixIcon: IconButton(
                onPressed: () => _selectTime(context, ref),
                icon: const FaIcon(FontAwesomeIcons.clock)),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2090));
    if (pickedate != null) {
      ref.read(dateProvider.notifier).state = pickedate;
    }
  }
}
