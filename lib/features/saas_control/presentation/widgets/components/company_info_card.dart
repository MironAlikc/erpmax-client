import 'package:erpmax_client/features/saas_control/presentation/widgets/components/subscriber_badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_base_components.dart';

class CompanyInfoCard extends StatelessWidget {
  final dynamic subscriber;
  const CompanyInfoCard({super.key, required this.subscriber});

  @override
  Widget build(BuildContext context) {
    return DetailBaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subscriber.company ?? "StartUp Inc",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const ActiveBadge(),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    InfoRowItem(
                      icon: CupertinoIcons.cube_box,
                      text: subscriber.plan ?? "Starter",
                    ),
                    const SizedBox(height: 12),
                    const InfoRowItem(
                      icon: CupertinoIcons.person_2,
                      text: "5 Users",
                    ),
                    const SizedBox(height: 12),
                    const InfoRowItem(
                      icon: CupertinoIcons.calendar,
                      text: "Start Date : 2024-05-20",
                    ),
                    const SizedBox(height: 12),
                    const InfoRowItem(
                      icon: CupertinoIcons.arrow_2_circlepath,
                      text: "Duration : 1 Year",
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    const InfoRowItem(
                      icon: CupertinoIcons.money_dollar,
                      text: "5000 SAR",
                    ),
                    const SizedBox(height: 12),
                    const InfoRowItem(
                      icon: CupertinoIcons.square_stack_3d_up,
                      text: "100 GB",
                    ),
                    const SizedBox(height: 12),
                    const InfoRowItem(
                      icon: CupertinoIcons.calendar,
                      text: "End Date : 2025-05-20",
                    ),
                    const SizedBox(height: 12),
                    const InfoRowItem(
                      icon: CupertinoIcons.calendar_badge_minus,
                      text: "Renewal Date :",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
