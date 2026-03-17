import '../models/match_model.dart';
import '../../../../core/constants/mock_data.dart';
import '../../../../core/constants/api_constants.dart';

abstract class MatchesDemoDataSource {
  Future<List<MatchModel>> getTodayMatches();
  Future<List<MatchModel>> getYesterdayMatches();
  Future<List<MatchModel>> getTomorrowMatches();
}

class MatchesDemoDataSourceImpl implements MatchesDemoDataSource {
  // Simulate network delay
  static const Duration _networkDelay = Duration(milliseconds: 500);

  @override
  Future<List<MatchModel>> getTodayMatches() async {
    await Future.delayed(_networkDelay);
    return MockMatchesData.getTodayMockMatches()
        .map((match) => MatchModel.fromEntity(match))
        .toList();
  }

  @override
  Future<List<MatchModel>> getYesterdayMatches() async {
    await Future.delayed(_networkDelay);
    return MockMatchesData.getYesterdayMockMatches()
        .map((match) => MatchModel.fromEntity(match))
        .toList();
  }

  @override
  Future<List<MatchModel>> getTomorrowMatches() async {
    await Future.delayed(_networkDelay);
    return MockMatchesData.getTomorrowMockMatches()
        .map((match) => MatchModel.fromEntity(match))
        .toList();
  }
}
