import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Models/analyse/analyse_model.dart';

// final analyseProvider = ChangeNotifierProvider((ref) => AnalyseProvider());

final analyseProvider = ChangeNotifierProvider((ref) {
  return AnalyseProvider();
});

class AnalyseProvider with ChangeNotifier {
  List<AnalyseGlobal> _analyseList = [];

  AnalyseGlobal updateModel(AnalyseModel model, String entrepriseId, String? fieldId) {
    AnalyseGlobal analyseGlobal =
        AnalyseGlobal(analyseModel: model, entrepriseID: entrepriseId, fieldID: fieldId, lastRefresh: DateTime.now());
    _analyseList.add(analyseGlobal);
    notifyListeners();
    return analyseGlobal;
  }

  AnalyseGlobal? findModel(String entrepriseId, String? fieldId) {
    int index = 0;
    if (_analyseList.isNotEmpty && _analyseList.length > 0) {
      if (fieldId != null) {
        index = _analyseList
            .indexWhere((element) => (element.entrepriseID == entrepriseId) && (element.fieldID == fieldId));
      } else {
        index = _analyseList.indexWhere((element) => element.entrepriseID == entrepriseId);
      }
      if (index != -1) return _analyseList.elementAt(index);
      return null;
    } else
      return null;
  }
}

class AnalyseGlobal {
  final DateTime lastRefresh;
  final AnalyseModel analyseModel;
  final String entrepriseID;
  final String? fieldID;
  AnalyseGlobal({
    required this.analyseModel,
    required this.entrepriseID,
    this.fieldID,
    required this.lastRefresh,
  });
}
