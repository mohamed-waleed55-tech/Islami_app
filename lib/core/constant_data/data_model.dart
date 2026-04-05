
import 'package:flutter/cupertino.dart';
import 'package:islam/presentation/main_layout/tabs/quran/screen/most_recent_suras.dart';

class SuraDM {
  final String suraEnName;
  final String suraArName;
  final int verses;
  final int suraNum;
   GlobalKey<MostRecentSurasState>? recentSurasKey;

  SuraDM({
    required this.suraNum,
    required this.suraEnName,
    required this.suraArName,
    required this.verses,
     this.recentSurasKey
  });

  SuraDM copyWith({
    String? suraEnName,
    String? suraArName,
    int? verses,
    int? suraNum,
    GlobalKey<MostRecentSurasState>? recentSurasKey,
  }) {
    return SuraDM(
      suraEnName: suraEnName ?? this.suraEnName,
      suraArName: suraArName ?? this.suraArName,
      verses: verses ?? this.verses,
      suraNum: suraNum ?? this.suraNum,
      recentSurasKey: recentSurasKey ?? this.recentSurasKey,
    );
  }
}