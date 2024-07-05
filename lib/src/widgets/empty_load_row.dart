import 'package:flutter/material.dart';

class EmptyLoadRow extends StatelessWidget {
  const EmptyLoadRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 140,
          width: 140,
          color: Colors.grey[300]!,
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            children: [
              EmptyColumn(),
              EmptyColumn(),
              EmptyColumn(),
              EmptyColumn(),
            ],
          ),
        )
      ],
    );
  }
}

class EmptyColumn extends StatelessWidget {
  const EmptyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(height: 20, color: Colors.grey[300]!),
      ],
    );
  }
}
