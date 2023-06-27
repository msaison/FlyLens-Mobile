// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyse_model.freezed.dart';
part 'analyse_model.g.dart';

@freezed
class AnalyseModel with _$AnalyseModel {
  const factory AnalyseModel({
    required String message,
    required double health_score,
    @LeafConvert() required Leaf classes_stats,
  }) = _AnalyseModel;

  factory AnalyseModel.fromJson(Map<String, dynamic> json) => _$AnalyseModelFromJson(json);
}

class LeafConvert implements JsonConverter<Leaf, Map<String, dynamic>> {
  const LeafConvert();
  @override
  Leaf fromJson(Map<String, dynamic> json) {
    Leaf _leaf = Leaf();
    json.forEach(
      (String key, value) {
        if (key == 'Unhealthy-leaf') {
          _leaf.setUnhealthy(UnhealthyLeaf(value));
        } else {
          _leaf.setHealthy(HealthyLeaf(value));
        }
      },
    );
    return _leaf;
  }

  @override
  Map<String, dynamic> toJson(Leaf object) {
    return {
      'Unhealthy-leaf': object.unhealthyLeaf,
      'Healthy-leaf': object.healthyleaf,
    };
  }
}

class Leaf {
  HealthyLeaf? _healthyLeaf;
  UnhealthyLeaf? _unhealthyLeaf;

  void setHealthy(HealthyLeaf healthyLeaf_) => _healthyLeaf = healthyLeaf_;
  void setUnhealthy(UnhealthyLeaf unhealthyLeaf_) => _unhealthyLeaf = unhealthyLeaf_;

  HealthyLeaf? get healthyleaf => _healthyLeaf;
  UnhealthyLeaf? get unhealthyLeaf => _unhealthyLeaf;
}

class LeafT {
  LeafT(this.mean, this.total, this.count);

  double mean;
  double total;
  int count;
}

class UnhealthyLeaf extends LeafT {
  UnhealthyLeaf(Map<String, dynamic> json) : super(json['mean'], json['total'], json['count']);
}

class HealthyLeaf extends LeafT {
  HealthyLeaf(Map<String, dynamic> json) : super(json['mean'], json['total'], json['count']);
}
