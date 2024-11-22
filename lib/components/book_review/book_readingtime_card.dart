import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class BookReadingtimeCard extends StatelessWidget {
  final DateTime startedAt;
  final DateTime? finishedAt;
  final int readTime; // 초 단위

  const BookReadingtimeCard({
    super.key,
    required this.startedAt,
    this.finishedAt,
    required this.readTime,
  });

  String _formatDate(DateTime date) {
    return '${date.month}월 ${date.day}일';
  }

  String _formatDuration() {
    if (finishedAt == null) return '0일';
    return '${finishedAt!.difference(startedAt).inDays}일';
  }

  String _formatReadTime() {
    int hours = readTime ~/ 3600;
    int minutes = (readTime % 3600) ~/ 60;
    int seconds = readTime % 60;
    return '$hours시간 $minutes분 $seconds초';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '독서 시작',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.unreadColor,
                  ),
                ),
                Text(
                  _formatDate(startedAt),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '독서 완료',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.unreadColor,
                  ),
                ),
                Text(
                  finishedAt != null ? _formatDate(finishedAt!) : '-',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '총 독서 시간 ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.unreadColor,
                  ),
                ),
                Text(
                  _formatReadTime(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            /*
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '소요 일수',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    
                    fontSize: 14,
                    color: AppColors.unreadColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatDuration(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            */
          ],
        ),
      ],
    );
  }
}
