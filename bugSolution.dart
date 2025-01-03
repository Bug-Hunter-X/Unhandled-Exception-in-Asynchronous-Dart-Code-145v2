```dart
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success!  Do something with 'response.body'
      print('Success: ${response.body}');
    } else {
      // Handle non-200 status codes
      print('Error: HTTP status code ${response.statusCode}');
      // Optionally throw a custom exception for higher-level handling
      throw HttpException('HTTP request failed', response.statusCode);
    }
  } on SocketException catch (e) {
    // Handle socket exceptions (no internet connection, etc.)
    print('Network error: $e');
  } on HttpException catch (e) {
    // Handle custom HTTP exceptions
    print('HTTP error: ${e.message}, status code: ${e.statusCode}');
  } catch (e) {
    // Handle any other unexpected exceptions
    print('Unexpected error: $e');
  }
}

//Custom exception for HTTP errors
class HttpException implements Exception {
  final String message;
  final int? statusCode;
  HttpException(this.message, [this.statusCode]);
}
```