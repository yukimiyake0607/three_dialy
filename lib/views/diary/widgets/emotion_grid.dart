import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindow/domain/models/emotion.dart';

final selectedEmotionProvider =
    StateProvider<Emotion?>((ref) => Emotion.joy);

class EmotionGrid extends ConsumerWidget {
  const EmotionGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEmotion = ref.watch(selectedEmotionProvider);

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: Emotion.values.length,
      itemBuilder: (context, index) {
        final emotion = Emotion.values[index];
        final isSelected = selectedEmotion == emotion;

        return EmotionButton(
          emotion: emotion,
          isSelected: isSelected,
          onPressed: () {
            ref.read(selectedEmotionProvider.notifier).state = emotion;
          },
        );
      },
    );
  }
}

class EmotionButton extends StatelessWidget {
  final Emotion emotion;
  final bool isSelected;
  final VoidCallback onPressed;

  const EmotionButton({
    super.key,
    required this.emotion,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isSelected ? 2 : 0,
      borderRadius: BorderRadius.circular(8),
      color: isSelected ? Theme.of(context).primaryColor : Colors.grey[200],
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Center(
            child: Text(
              emotion.label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
