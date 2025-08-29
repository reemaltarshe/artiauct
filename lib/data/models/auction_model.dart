class AuctionModel {
  final int? id;
  final String name;
  final String description;
  final double startPrice;
  final double? currentPrice;
  final double? reservePrice;
  final String category;
  final List<String> images;
  final int sellerId;
  final String sellerName;
  final String? sellerImage;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final bool isEnded;
  final bool isReserved;
  final int bidCount;
  final List<BidModel> bids;
  final String? winnerId;
  final String? winnerName;

  AuctionModel({
    this.id,
    required this.name,
    required this.description,
    required this.startPrice,
    this.currentPrice,
    this.reservePrice,
    required this.category,
    required this.images,
    required this.sellerId,
    required this.sellerName,
    this.sellerImage,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    this.isActive = true,
    this.isEnded = false,
    this.isReserved = false,
    this.bidCount = 0,
    this.bids = const [],
    this.winnerId,
    this.winnerName,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) {
    return AuctionModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      startPrice: (json['start_price'] ?? 0.0).toDouble(),
      currentPrice: json['current_price'] != null 
          ? (json['current_price'] as num).toDouble() 
          : null,
      reservePrice: json['reserve_price'] != null 
          ? (json['reserve_price'] as num).toDouble() 
          : null,
      category: json['category'] ?? '',
      images: json['images'] != null 
          ? List<String>.from(json['images']) 
          : [],
      sellerId: json['seller_id'] ?? 0,
      sellerName: json['seller_name'] ?? '',
      sellerImage: json['seller_image'],
      startDate: json['start_date'] != null 
          ? DateTime.parse(json['start_date']) 
          : DateTime.now(),
      endDate: json['end_date'] != null 
          ? DateTime.parse(json['end_date']) 
          : DateTime.now(),
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
      isActive: json['is_active'] ?? true,
      isEnded: json['is_ended'] ?? false,
      isReserved: json['is_reserved'] ?? false,
      bidCount: json['bid_count'] ?? 0,
      bids: json['bids'] != null 
          ? (json['bids'] as List)
              .map((bid) => BidModel.fromJson(bid))
              .toList()
          : [],
      winnerId: json['winner_id'],
      winnerName: json['winner_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'start_price': startPrice,
      if (currentPrice != null) 'current_price': currentPrice,
      if (reservePrice != null) 'reserve_price': reservePrice,
      'category': category,
      'images': images,
      'seller_id': sellerId,
      'seller_name': sellerName,
      if (sellerImage != null) 'seller_image': sellerImage,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_active': isActive,
      'is_ended': isEnded,
      'is_reserved': isReserved,
      'bid_count': bidCount,
      'bids': bids.map((bid) => bid.toJson()).toList(),
      if (winnerId != null) 'winner_id': winnerId,
      if (winnerName != null) 'winner_name': winnerName,
    };
  }

  AuctionModel copyWith({
    int? id,
    String? name,
    String? description,
    double? startPrice,
    double? currentPrice,
    double? reservePrice,
    String? category,
    List<String>? images,
    int? sellerId,
    String? sellerName,
    String? sellerImage,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    bool? isEnded,
    bool? isReserved,
    int? bidCount,
    List<BidModel>? bids,
    String? winnerId,
    String? winnerName,
  }) {
    return AuctionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startPrice: startPrice ?? this.startPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      reservePrice: reservePrice ?? this.reservePrice,
      category: category ?? this.category,
      images: images ?? this.images,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      sellerImage: sellerImage ?? this.sellerImage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      isEnded: isEnded ?? this.isEnded,
      isReserved: isReserved ?? this.isReserved,
      bidCount: bidCount ?? this.bidCount,
      bids: bids ?? this.bids,
      winnerId: winnerId ?? this.winnerId,
      winnerName: winnerName ?? this.winnerName,
    );
  }

  String get mainImage => images.isNotEmpty ? images.first : '';

  String get formattedStartPrice => '\$${startPrice.toStringAsFixed(2)}';

  String get formattedCurrentPrice => currentPrice != null 
      ? '\$${currentPrice!.toStringAsFixed(2)}' 
      : formattedStartPrice;

  String get formattedReservePrice => reservePrice != null 
      ? '\$${reservePrice!.toStringAsFixed(2)}' 
      : 'No reserve';

  bool get hasImages => images.isNotEmpty;

  bool get isAvailable => isActive && !isEnded && DateTime.now().isBefore(endDate);

  bool get isExpired => DateTime.now().isAfter(endDate);

  Duration get timeRemaining {
    final now = DateTime.now();
    if (now.isAfter(endDate)) return Duration.zero;
    return endDate.difference(now);
  }

  String get timeRemainingText {
    final duration = timeRemaining;
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m';
    } else {
      return 'Ending soon';
    }
  }

  bool get hasReserve => reservePrice != null && reservePrice! > 0;

  bool get isReserveMet => currentPrice != null && 
      reservePrice != null && 
      currentPrice! >= reservePrice!;

  BidModel? get highestBid => bids.isNotEmpty 
      ? bids.reduce((a, b) => a.amount > b.amount ? a : b) 
      : null;

  @override
  String toString() {
    return 'AuctionModel(id: $id, name: $name, startPrice: $startPrice, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuctionModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class BidModel {
  final int? id;
  final int auctionId;
  final int bidderId;
  final String bidderName;
  final String? bidderImage;
  final double amount;
  final DateTime createdAt;

  BidModel({
    this.id,
    required this.auctionId,
    required this.bidderId,
    required this.bidderName,
    this.bidderImage,
    required this.amount,
    required this.createdAt,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      id: json['id'],
      auctionId: json['auction_id'] ?? 0,
      bidderId: json['bidder_id'] ?? 0,
      bidderName: json['bidder_name'] ?? '',
      bidderImage: json['bidder_image'],
      amount: (json['amount'] ?? 0.0).toDouble(),
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'auction_id': auctionId,
      'bidder_id': bidderId,
      'bidder_name': bidderName,
      if (bidderImage != null) 'bidder_image': bidderImage,
      'amount': amount,
      'created_at': createdAt.toIso8601String(),
    };
  }

  String get formattedAmount => '\$${amount.toStringAsFixed(2)}';

  @override
  String toString() {
    return 'BidModel(id: $id, auctionId: $auctionId, bidderName: $bidderName, amount: $amount)';
  }
} 