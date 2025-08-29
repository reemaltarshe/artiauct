class ProductModel {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String> images;
  final int sellerId;
  final String sellerName;
  final String? sellerImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final bool isSold;
  final double? rating;
  final int reviewCount;
  final bool isInWishlist;

  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.images,
    required this.sellerId,
    required this.sellerName,
    this.sellerImage,
    required this.createdAt,
    required this.updatedAt,
    this.isActive = true,
    this.isSold = false,
    this.rating,
    this.reviewCount = 0,
    this.isInWishlist = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      category: json['category'] ?? '',
      images: json['images'] != null 
          ? List<String>.from(json['images']) 
          : [],
      sellerId: json['seller_id'] ?? 0,
      sellerName: json['seller_name'] ?? '',
      sellerImage: json['seller_image'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
      isActive: json['is_active'] ?? true,
      isSold: json['is_sold'] ?? false,
      rating: json['rating'] != null 
          ? (json['rating'] as num).toDouble() 
          : null,
      reviewCount: json['review_count'] ?? 0,
      isInWishlist: json['is_in_wishlist'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'images': images,
      'seller_id': sellerId,
      'seller_name': sellerName,
      if (sellerImage != null) 'seller_image': sellerImage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_active': isActive,
      'is_sold': isSold,
      if (rating != null) 'rating': rating,
      'review_count': reviewCount,
      'is_in_wishlist': isInWishlist,
    };
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? category,
    List<String>? images,
    int? sellerId,
    String? sellerName,
    String? sellerImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    bool? isSold,
    double? rating,
    int? reviewCount,
    bool? isInWishlist,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      images: images ?? this.images,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      sellerImage: sellerImage ?? this.sellerImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      isSold: isSold ?? this.isSold,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isInWishlist: isInWishlist ?? this.isInWishlist,
    );
  }

  String get mainImage => images.isNotEmpty ? images.first : '';

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  String get formattedRating => rating != null ? rating!.toStringAsFixed(1) : '0.0';

  bool get hasImages => images.isNotEmpty;

  bool get isAvailable => isActive && !isSold;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 