# Artiauct - Handmade Products Marketplace

A comprehensive Flutter application for buying and selling handmade products with auction capabilities.

## 🚀 Recent Improvements

### Architecture Enhancements
- **GetX State Management**: Implemented proper state management using GetX controllers
- **MVC Pattern**: Organized code into Models, Views, and Controllers
- **API Service Layer**: Centralized API communication with proper error handling
- **Form Controllers**: Added controllers to all form fields for better data management

### New Features Added

#### 1. **Authentication System**
- **AuthController**: Complete authentication management
- **User Registration**: With email verification
- **Login/Logout**: Secure token-based authentication
- **Password Management**: Reset and change password functionality
- **Form Validation**: Comprehensive input validation

#### 2. **Product Management**
- **ProductController**: Full CRUD operations for products
- **Product Model**: Comprehensive data model with validation
- **Image Upload**: Support for multiple product images
- **Category Management**: Organized product categorization
- **Search & Filter**: Advanced filtering capabilities

#### 3. **Auction System**
- **AuctionController**: Complete auction management
- **Auction Model**: Detailed auction data structure
- **Bidding System**: Real-time bidding functionality
- **Time Management**: Auction end date handling
- **Reserve Price**: Optional reserve price support

#### 4. **Messaging System**
- **MessageController**: Real-time messaging capabilities
- **Chat Interface**: User-friendly chat UI
- **Conversation Management**: Organized message threads
- **Unread Count**: Message notification system

#### 5. **Comment System**
- **CommentController**: Product review and comment management
- **User Reviews**: Product rating and feedback
- **Comment Moderation**: Admin control over comments

### Backend Integration

#### API Service (`lib/core/services/api_service.dart`)
```dart
// Centralized API communication
class ApiService {
  // Authentication endpoints
  Future<Map<String, dynamic>> login(String username, String password)
  Future<Map<String, dynamic>> register(Map<String, dynamic> userData)
  Future<Map<String, dynamic>> verifyOTP(String email, String otpCode)
  
  // Product endpoints
  Future<Map<String, dynamic>> getProducts({Map<String, dynamic>? filters})
  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> productData)
  Future<Map<String, dynamic>> updateProduct(int productId, Map<String, dynamic> productData)
  
  // Auction endpoints
  Future<Map<String, dynamic>> getAuctions({Map<String, dynamic>? filters})
  Future<Map<String, dynamic>> createAuction(Map<String, dynamic> auctionData)
  Future<Map<String, dynamic>> placeBid(int auctionId, double amount)
  
  // User profile endpoints
  Future<Map<String, dynamic>> getUserProfile()
  Future<Map<String, dynamic>> updateUserProfile(Map<String, dynamic> profileData)
}
```

#### Data Models
- **UserModel**: Complete user data structure
- **ProductModel**: Product information with images and metadata
- **AuctionModel**: Auction details with bidding history

### Controllers Overview

#### 1. **AuthController** (`lib/controllers/auth_controller.dart`)
- User authentication and registration
- Form validation and error handling
- Token management and session handling
- Password visibility toggles

#### 2. **ProductController** (`lib/controllers/product_controller.dart`)
- Product CRUD operations
- Image management
- Search and filtering
- Category management

#### 3. **AuctionController** (`lib/controllers/auction_controller.dart`)
- Auction creation and management
- Bidding system
- Time-based auction handling
- Reserve price functionality

#### 4. **MessageController** (`lib/controllers/message_controller.dart`)
- Real-time messaging
- Conversation management
- Message history
- Unread message tracking

#### 5. **CommentController** (`lib/controllers/comment_controller.dart`)
- Product comments and reviews
- Comment moderation
- User feedback system

### Form Improvements

All forms now include:
- **TextEditingController**: Proper form field management
- **Validation**: Input validation with error messages
- **Loading States**: Loading indicators during API calls
- **Error Handling**: User-friendly error messages
- **Success Feedback**: Success notifications

### Key Features

#### Authentication
- ✅ User registration with email verification
- ✅ Secure login with token storage
- ✅ Password reset functionality
- ✅ Profile management
- ✅ Session persistence

#### Product Management
- ✅ Add/edit/delete products
- ✅ Multiple image upload
- ✅ Category organization
- ✅ Search and filtering
- ✅ Price management

#### Auction System
- ✅ Create auctions with end dates
- ✅ Real-time bidding
- ✅ Reserve price support
- ✅ Time-based auction management
- ✅ Bid history tracking

#### Messaging
- ✅ Real-time chat
- ✅ Conversation management
- ✅ Message notifications
- ✅ User search

#### Comments & Reviews
- ✅ Product reviews
- ✅ Comment moderation
- ✅ User feedback
- ✅ Rating system

### Technical Improvements

#### State Management
- **GetX Controllers**: Reactive state management
- **Observable Variables**: Real-time UI updates
- **Form Controllers**: Proper form handling
- **Error Management**: Centralized error handling

#### API Integration
- **HTTP Client**: Proper API communication
- **Token Management**: Secure authentication
- **Error Handling**: Comprehensive error management
- **Response Parsing**: JSON to model conversion

#### UI/UX Enhancements
- **Loading States**: User feedback during operations
- **Error Messages**: Clear error communication
- **Success Notifications**: Positive user feedback
- **Form Validation**: Real-time input validation

### File Structure

```
lib/
├── controllers/           # GetX Controllers
│   ├── auth_controller.dart
│   ├── product_controller.dart
│   ├── auction_controller.dart
│   ├── message_controller.dart
│   └── comment_controller.dart
├── core/
│   └── services/
│       └── api_service.dart
├── data/
│   └── models/
│       ├── user_model.dart
│       ├── product_model.dart
│       └── auction_model.dart
└── view/                 # UI Components
    ├── login/
    ├── signup/
    ├── add_post_sale/
    ├── add_post_auction/
    ├── messages/
    ├── comment/
    └── ...
```

### Getting Started

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Configure Backend URL**
   Update the base URL in `lib/core/services/api_service.dart`:
   ```dart
   static const String baseUrl = 'YOUR_BACKEND_URL';
   ```

3. **Run the Application**
   ```bash
   flutter run
   ```

### Backend Requirements

The app expects a RESTful API with the following endpoints:

#### Authentication
- `POST /token-auth/` - Login
- `POST /register/` - User registration
- `POST /register/verify-otp/` - Email verification
- `POST /reset-password/` - Password reset

#### Products
- `GET /products/` - Get products with filters
- `POST /products/` - Create product
- `PUT /products/{id}/` - Update product
- `DELETE /products/{id}/` - Delete product

#### Auctions
- `GET /auctions/` - Get auctions with filters
- `POST /auctions/` - Create auction
- `POST /auctions/{id}/bid/` - Place bid

#### User Profile
- `GET /profile/` - Get user profile
- `PUT /profile/` - Update profile

#### Messages
- `GET /messages/` - Get conversations
- `GET /messages/{userId}/` - Get chat messages
- `POST /messages/` - Send message

#### Comments
- `GET /products/{id}/comments/` - Get product comments
- `POST /products/{id}/comments/` - Add comment

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  http: ^0.13.5
  shared_preferences: ^2.0.15
  dotted_border: ^2.0.0+3
  dropdown_button2: ^2.3.9
```

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

### License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Note**: This app is now fully prepared for backend integration with comprehensive error handling, form validation, and state management. All forms have proper controllers and the code follows Flutter best practices.
