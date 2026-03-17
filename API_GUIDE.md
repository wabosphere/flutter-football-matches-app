# API Documentation - Torliga

## Staging vs Production

### Staging API
- **URL**: https://staging.torliga.com/api/v1
- **Purpose**: Testing and development
- **Data**: Test data and fixtures
- **Use Case**: Testing new features before production

### Production API
- **URL**: https://torliga.com/api/v1
- **Purpose**: Real-time live data
- **Data**: Actual league data, teams, matches
- **Use Case**: Live production app with real users

---

## Current API Endpoints Status

### ❌ **Not Found (404)**
The following endpoints return 404:
- `/home/todayMatches`
- `/home/yesterdayMatches`
- `/home/tomorrowMatches`

**Status**: These endpoints don't exist in the current API.

---

## Available API Resources

### ✅ **Base API** (Working)
- **Endpoint**: `https://staging.torliga.com/api/v1/`
- **Response**: `{"message":"Torliga API","version":"2.3.0"}`

---

## What You Need to Implement

### 1. **Find the Real Match Endpoints**
You need to discover the actual API endpoints from Torliga that provide:
- List of matches by date
- Team information (names, logos)
- League information
- Match scores and status

**Next Steps**:
- Check Torliga API documentation
- Use browser DevTools to inspect API calls made by their web app
- Contact Torliga API support for endpoint reference

### 2. **Team Data (Logos & Names)**
Typically provided by APIs as:
```json
{
  "id": "team-123",
  "name": "Manchester United",
  "logo": "https://url-to-logo.png",
  "badge": "https://url-to-badge.png"
}
```

**Sources**:
- Torliga API (if they provide team data)
- Alternative: Use a separate football data API (e.g., API-FOOTBALL, RapidAPI Football)
- Local storage: Cache team logos and names in your app

### 3. **Store Team Assets Locally**
Create a model to store team information:

```dart
class Team {
  final String id;
  final String name;
  final String? logoUrl;
  final String? badgeUrl;

  Team({
    required this.id,
    required this.name,
    this.logoUrl,
    this.badgeUrl,
  });
}
```

---

## Demo Mode vs Live Mode

### Demo Mode
- Uses mock data included in the app
- No API calls needed
- Perfect for testing UI
- **Located in**: `lib/core/constants/mock_data.dart`

### Live Mode
- Connects to real Torliga API
- Pulls real match data and team information
- Requires internet connection
- Error handling: "Verify connection" on failures

**Toggle in App**: Use Settings page to switch between modes

---

## Action Items

1. **Discover Torliga API Endpoints**
   - Check their public documentation
   - Reverse-engineer from their web/mobile app
   - Contact their support

2. **Update API Constants**
   - Replace dummy endpoints with real ones
   - Update headers if needed (auth tokens, etc.)

3. **Fetch Team Data**
   - Implement team logo caching
   - Store/display team names correctly
   - Handle missing logo URLs gracefully

4. **Your Predictions Feature**
   - Add prediction UI component
   - Store predictions locally
   - Display on match cards

---

## Current Setup

- **Demo Mode**: Data from `lib/core/constants/mock_data.dart`
- **Live Mode**: Will fetch from discovered real API endpoints
- **Toggle**: Settings Page > App Mode switch
- **Caching**: SharedPreferences stores the mode preference
