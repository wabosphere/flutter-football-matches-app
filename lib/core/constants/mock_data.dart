import '../../../features/matches/domain/entities/match.dart';

/// Mock data for demo mode
class MockMatchesData {
  static List<Match> getTodayMockMatches() {
    return [
      Match(
        id: '1',
        homeTeam: 'Manchester United',
        awayTeam: 'Liverpool',
        homeScore: 2,
        awayScore: 1,
        status: 'LIVE',
        kickoffTime: DateTime.now(),
        venue: 'Old Trafford',
        competition: 'Premier League',
        weekNumber: 20,
        minute: 67,
      ),
      Match(
        id: '2',
        homeTeam: 'Manchester City',
        awayTeam: 'Chelsea',
        homeScore: 3,
        awayScore: 0,
        status: 'FINISHED',
        kickoffTime: DateTime.now().subtract(Duration(hours: 2)),
        venue: 'Etihad Stadium',
        competition: 'Premier League',
        weekNumber: 20,
        minute: 90,
      ),
      Match(
        id: '3',
        homeTeam: 'Arsenal',
        awayTeam: 'Tottenham',
        homeScore: 1,
        awayScore: 1,
        status: 'LIVE',
        kickoffTime: DateTime.now(),
        venue: 'Emirates Stadium',
        competition: 'Premier League',
        weekNumber: 20,
        minute: 45,
      ),
    ];
  }

  static List<Match> getYesterdayMockMatches() {
    return [
      Match(
        id: '4',
        homeTeam: 'Newcastle United',
        awayTeam: 'Brighton',
        homeScore: 2,
        awayScore: 2,
        status: 'FINISHED',
        kickoffTime: DateTime.now().subtract(Duration(days: 1)),
        venue: 'St James\' Park',
        competition: 'Premier League',
        weekNumber: 19,
        minute: 90,
      ),
      Match(
        id: '5',
        homeTeam: 'Aston Villa',
        awayTeam: 'Everton',
        homeScore: 3,
        awayScore: 1,
        status: 'FINISHED',
        kickoffTime: DateTime.now().subtract(Duration(days: 1, hours: 3)),
        venue: 'Villa Park',
        competition: 'Premier League',
        weekNumber: 19,
        minute: 90,
      ),
    ];
  }

  static List<Match> getTomorrowMockMatches() {
    return [
      Match(
        id: '6',
        homeTeam: 'Crystal Palace',
        awayTeam: 'Fulham',
        homeScore: null,
        awayScore: null,
        status: 'SCHEDULED',
        kickoffTime: DateTime.now().add(Duration(days: 1, hours: 3)),
        venue: 'Selhurst Park',
        competition: 'Premier League',
        weekNumber: 21,
        minute: null,
      ),
      Match(
        id: '7',
        homeTeam: 'West Ham',
        awayTeam: 'Burnley',
        homeScore: null,
        awayScore: null,
        status: 'SCHEDULED',
        kickoffTime: DateTime.now().add(Duration(days: 1, hours: 4)),
        venue: 'London Stadium',
        competition: 'Premier League',
        weekNumber: 21,
        minute: null,
      ),
    ];
  }
}
