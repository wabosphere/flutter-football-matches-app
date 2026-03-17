# App Features Documentation

## 1. Demo vs Live Mode

### Configuration
The app supports two modes: **DEMO** and **LIVE**

To switch modes, edit `lib/core/constants/app_config.dart`:

```dart
static const AppMode currentMode = AppMode.live; // or AppMode.demo
```

### Demo Mode
- Uses mock/simulated data
- Points to local development API (`http://localhost:8000`)
- Perfect for UI testing without server dependency
- WebSocket connects to local mock server

### Live Mode
- Uses real API data
- Points to production API (`https://api.example.com`)
- Fetches actual match data and live updates
- WebSocket connects to production server for real-time updates

---

## 2. Extended Date Range Support

### Current Implementation
The app displays match data for:
- Yesterday
- Today
- Tomorrow

### Future Enhancement
The app is designed to support unlimited date range:
- "Day Before Yesterday" (2 days ago)
- "Day After Tomorrow" (2 days ahead)
- Dynamic support for N days in past/future
- Infinite scrolling through date tabs

### Internationalization
Date labels are fully internationalized:
- **English**: Yesterday, Today, Tomorrow, Day Before Yesterday, Day After Tomorrow
- **Arabic**: أمس, اليوم, غداً, أول أمس, بعد غداً

Placeholders for dynamic dates:
- `daysInPast`: "{count} days ago"
- `daysInFuture`: "{count} days ahead"

---

## 3. UI Enhancements

### Full Screen Mode
The app now runs in immersive/full-screen mode:
- Status bar is hidden
- Navigation bar (dock) is hidden
- Provides better viewing experience for match data
- Set in `lib/main.dart` with `SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive)`

### Error Handling
- Simplified error messages: "Verify connection"
- Applied to all data loading scenarios:
  - Match fetching
  - Data refresh
  - WebSocket connections

---

## Implementation Guide for Extended Dates

To fully implement the infinite date scrolling:

### 1. Update BLoC Events
Add new events in `matches_event.dart`:
```dart
class LoadMatchesByDaysEvent extends MatchesEvent {
  final int dayOffset; // negative = past, positive = future
  LoadMatchesByDaysEvent(this.dayOffset);
}
```

### 2. Update State Management
Modify `matches_state.dart` to store matches for multiple date offsets

### 3. Create DateTime Helper
```dart
// Get label for a given date offset
String getDateLabel(int daysOffset, AppLocalizations l10n) {
  switch(daysOffset) {
    case -2: return l10n.dayBeforeYesterday;
    case -1: return l10n.yesterday;
    case 0: return l10n.today;
    case 1: return l10n.tomorrow;
    case 2: return l10n.dayAfterTomorrow;
    default:
      return daysOffset < 0
        ? l10n.daysInPast(daysOffset.abs())
        : l10n.daysInFuture(daysOffset);
  }
}
```

### 4. Dynamic Tab Generation
Update `matches_page.dart` to generate tabs dynamically based on date offsets
