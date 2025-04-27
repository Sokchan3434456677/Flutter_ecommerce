import 'package:flutter/material.dart';
import 'package:flutter_application_a3/Model/model.dart';
import 'package:flutter_application_a3/Utils/color.dart';

class CuratedItem extends StatelessWidget {
  final AppModel eCommerceItem;
  final Size size;
  // Example item
  const CuratedItem({
    super.key,
    required this.eCommerceItem,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: fbackgroundColor2,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(eCommerceItem.image),
            ),
          ),
          height: size.height * 0.25,
          width: size.width * 0.5,
        ),
      ],
    );
  }
}
