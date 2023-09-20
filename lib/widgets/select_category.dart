
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task_app/providers/provider.dart';
import 'package:task_app/utils/extension.dart';
import 'package:task_app/utils/task_categories.dart';
import 'package:task_app/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SelectCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    final style = context.textTheme;

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: style.titleLarge,
          ),
          const Gap(8),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((cxt, index) {
                    final category = categories[index];
                    return InkWell(
                        onTap: () {
                          ref.read(categoryProvider.notifier).state = category;
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: CircleContainer(
                          color: category.color.withOpacity(0.3),
                          child: Icon(
                            category.icon,
                            color: category == SelectCategory
                                ? context.colorScheme.primary
                                : category.color,
                          ),
                        ));
                  }),
                  separatorBuilder: (cxt, index) => const Gap(16),
                  itemCount: categories.length))
        ],
      ),
    );
  }
}
