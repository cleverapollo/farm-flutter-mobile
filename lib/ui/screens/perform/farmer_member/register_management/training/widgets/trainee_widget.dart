import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class TraineeWidget extends StatelessWidget {
  final List<FarmerWorker> selectedTrainees;
  final void Function(FarmerWorker) onRemove;

  const TraineeWidget({
    super.key,
    this.selectedTrainees = const <FarmerWorker>[],
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedTrainees.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colors.blueDark2,
            width: 2,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        runSpacing: 6,
        children: selectedTrainees
            .map(
              (trainee) => _TraineeSelectedItem(
                trainee: trainee,
                onRemove: () => onRemove(trainee),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TraineeSelectedItem extends StatelessWidget {
  final FarmerWorker trainee;
  final void Function() onRemove;

  _TraineeSelectedItem({
    required this.trainee,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRemove,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.blue,
        ),
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                  trainee.fullName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodyBold.white.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Assets.icons.icRemoveTrainee.svg(),
          ],
        ),
      ),
    );
  }
}
