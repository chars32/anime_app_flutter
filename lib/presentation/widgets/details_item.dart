import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String detailTitle;
  final String detailSubtitle;

  const DetailsItem({
    super.key,
    required this.detailTitle,
    required this.detailSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 70, 89, 131),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.star_rate,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 100,
              height: 45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    detailSubtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
