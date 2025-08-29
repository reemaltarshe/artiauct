import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.100.104:8000';
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';

  // Singleton pattern
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // Get stored token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  // Store token
  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  // Store user data
  Future<void> storeUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(userData));
  }

  // Get user data
  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(userKey);
    if (userData != null) {
      return jsonDecode(userData);
    }
    return null;
  }

  // Clear stored data (logout)
  Future<void> clearStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
    await prefs.remove(userKey);
  }

  // Generic GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .get(Uri.parse('$baseUrl$endpoint'), headers: headers)
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  // Generic POST request
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl$endpoint'),
            headers: headers,
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  // Generic PUT request
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .put(
            Uri.parse('$baseUrl$endpoint'),
            headers: headers,
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  // Generic DELETE request
  Future<Map<String, dynamic>> delete(String endpoint) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .delete(Uri.parse('$baseUrl$endpoint'), headers: headers)
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  // Handle response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {'success': true};
      }
      return jsonDecode(response.body);
    } else {
      String errorMessage = 'Server error';
      try {
        final errorData = jsonDecode(response.body);
        errorMessage = errorData['message'] ?? errorData['detail'] ?? errorMessage;
      } catch (e) {
        errorMessage = 'HTTP ${response.statusCode}';
      }
      throw ApiException(errorMessage);
    }
  }

  // Authentication methods
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await post('/token-auth/', {
      'username': username,
      'password': password,
    });

    if (response['token'] != null) {
      await storeToken(response['token']);
      if (response['user'] != null) {
        await storeUserData(response['user']);
      }
    }

    return response;
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    return await post('/register/', userData);
  }

  Future<Map<String, dynamic>> verifyOTP(String email, String otpCode) async {
    return await post('/register/verify-otp/', {
      'email': email,
      'otp_code': otpCode,
    });
  }

  Future<Map<String, dynamic>> resetPassword(String email) async {
    return await post('/reset-password/', {'email': email});
  }

  Future<Map<String, dynamic>> changePassword(String oldPassword, String newPassword) async {
    return await post('/change-password/', {
      'old_password': oldPassword,
      'new_password': newPassword,
    });
  }

  // Product methods
  Future<Map<String, dynamic>> getProducts({Map<String, dynamic>? filters}) async {
    String endpoint = '/products/';
    if (filters != null && filters.isNotEmpty) {
      final queryParams = filters.entries
          .where((entry) => entry.value != null)
          .map((entry) => '${entry.key}=${entry.value}')
          .join('&');
      endpoint += '?$queryParams';
    }
    return await get(endpoint);
  }

  Future<Map<String, dynamic>> getProduct(int productId) async {
    return await get('/products/$productId/');
  }

  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> productData) async {
    return await post('/products/', productData);
  }

  Future<Map<String, dynamic>> updateProduct(int productId, Map<String, dynamic> productData) async {
    return await put('/products/$productId/', productData);
  }

  Future<Map<String, dynamic>> deleteProduct(int productId) async {
    return await delete('/products/$productId/');
  }

  // Auction methods
  Future<Map<String, dynamic>> getAuctions({Map<String, dynamic>? filters}) async {
    String endpoint = '/auctions/';
    if (filters != null && filters.isNotEmpty) {
      final queryParams = filters.entries
          .where((entry) => entry.value != null)
          .map((entry) => '${entry.key}=${entry.value}')
          .join('&');
      endpoint += '?$queryParams';
    }
    return await get(endpoint);
  }

  Future<Map<String, dynamic>> getAuction(int auctionId) async {
    return await get('/auctions/$auctionId/');
  }

  Future<Map<String, dynamic>> createAuction(Map<String, dynamic> auctionData) async {
    return await post('/auctions/', auctionData);
  }

  Future<Map<String, dynamic>> placeBid(int auctionId, double amount) async {
    return await post('/auctions/$auctionId/bid/', {'amount': amount});
  }

  // User profile methods
  Future<Map<String, dynamic>> getUserProfile() async {
    return await get('/profile/');
  }

  Future<Map<String, dynamic>> updateUserProfile(Map<String, dynamic> profileData) async {
    return await put('/profile/', profileData);
  }

  Future<Map<String, dynamic>> uploadProfileImage(String imagePath) async {
    // Implementation for image upload
    // This would typically use multipart/form-data
    return await post('/profile/upload-image/', {'image_path': imagePath});
  }

  // Wishlist methods
  Future<Map<String, dynamic>> getWishlist() async {
    return await get('/wishlist/');
  }

  Future<Map<String, dynamic>> addToWishlist(int productId) async {
    return await post('/wishlist/', {'product_id': productId});
  }

  Future<Map<String, dynamic>> removeFromWishlist(int productId) async {
    return await delete('/wishlist/$productId/');
  }

  // Comment methods
  Future<Map<String, dynamic>> getComments(int productId) async {
    return await get('/products/$productId/comments/');
  }

  Future<Map<String, dynamic>> addComment(int productId, String comment) async {
    return await post('/products/$productId/comments/', {'comment': comment});
  }

  // Message methods
  Future<Map<String, dynamic>> getMessages() async {
    return await get('/messages/');
  }

  Future<Map<String, dynamic>> getChatMessages(int userId) async {
    return await get('/messages/$userId/');
  }

  Future<Map<String, dynamic>> sendMessage(int userId, String message) async {
    return await post('/messages/', {
      'recipient_id': userId,
      'message': message,
    });
  }

  // Notification methods
  Future<Map<String, dynamic>> getNotifications() async {
    return await get('/notifications/');
  }

  Future<Map<String, dynamic>> markNotificationAsRead(int notificationId) async {
    return await put('/notifications/$notificationId/', {'read': true});
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
} 