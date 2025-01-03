```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success!  Do something with 'response.body'
      print('Success: ${response.body}');
    } else {
      // Handle errors here
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (network errors, etc.)
    print('Error: $e');
    // Re-throw the error to be handled higher up if needed
    rethrow;
  }
}
```