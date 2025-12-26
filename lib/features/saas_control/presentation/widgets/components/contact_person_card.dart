import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_base_components.dart';

class ContactPersonCard extends StatelessWidget {
  const ContactPersonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailBaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "CONTACT PERSON",
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          const InfoRowItem(
            icon: CupertinoIcons.person,
            text: "Mohammed Ali",
            isBold: true,
          ),
          const SizedBox(height: 16),
          const InfoRowItem(
            icon: CupertinoIcons.mail,
            text: "contact@example.com",
          ),
          const SizedBox(height: 16),
          const InfoRowItem(
            icon: CupertinoIcons.phone,
            text: "+966 50 000 0000",
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
