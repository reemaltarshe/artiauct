import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/services/api_service.dart';
import 'package:handmade/data/models/auction_model.dart';

class AuctionController extends GetxController {
  final ApiService _apiService = ApiService();
  
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<AuctionModel> auctions = <AuctionModel>[].obs;
  final RxList<AuctionModel> filteredAuctions = <AuctionModel>[].obs;
  final Rx<AuctionModel?> selectedAuction = Rx<AuctionModel?>(null);
  final RxString errorMessage = ''.obs;
  final RxString selectedCategory = ''.obs;
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 10000.0.obs;
  final RxString searchQuery = ''.obs;

  // Form controllers for adding/editing auctions
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startPriceController = TextEditingController();
  final TextEditingController reservePriceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final RxList<String> selectedImages = <String>[].obs;
  final Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  // Pagination
  final RxInt currentPage = 1.obs;
  final RxBool hasMoreData = true.obs;
  final RxInt totalAuctions = 0.obs;

  // Categories
  final List<String> categories = [
    'Candle',
    'Accessories',
    'Decoration',
    'Carving',
    'Sweet',
    'Bags',
    'Painting',
    'Wool',
    'Other',
  ];

  @override
  void onInit() {
    super.onInit();
    loadAuctions();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    startPriceController.dispose();
    reservePriceController.dispose();
    categoryController.dispose();
    endDateController.dispose();
    super.onClose();
  }

  // Load auctions from API
  Future<void> loadAuctions({bool refresh = false}) async {
    if (refresh) {
      currentPage.value = 1;
      hasMoreData.value = true;
    }

    if (!hasMoreData.value || isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final filters = <String, dynamic>{
        'page': currentPage.value,
        'page_size': 20,
      };

      if (selectedCategory.value.isNotEmpty) {
        filters['category'] = selectedCategory.value;
      }
      if (searchQuery.value.isNotEmpty) {
        filters['search'] = searchQuery.value;
      }
      if (minPrice.value > 0) {
        filters['min_price'] = minPrice.value;
      }
      if (maxPrice.value < 10000) {
        filters['max_price'] = maxPrice.value;
      }

      final response = await _apiService.getAuctions(filters: filters);
      
      if (response['results'] != null) {
        final List<AuctionModel> newAuctions = (response['results'] as List)
            .map((auction) => AuctionModel.fromJson(auction))
            .toList();

        if (refresh) {
          auctions.clear();
          filteredAuctions.clear();
        }

        auctions.addAll(newAuctions);
        filteredAuctions.addAll(newAuctions);

        totalAuctions.value = response['count'] ?? 0;
        hasMoreData.value = newAuctions.length == 20; // Assuming page size is 20
        currentPage.value++;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Load single auction
  Future<void> loadAuction(int auctionId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.getAuction(auctionId);
      selectedAuction.value = AuctionModel.fromJson(response);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Create new auction
  Future<bool> createAuction() async {
    if (!_validateAuctionForm()) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final auctionData = {
        'name': nameController.text.trim(),
        'description': descriptionController.text.trim(),
        'start_price': double.parse(startPriceController.text.trim()),
        'category': categoryController.text.trim(),
        'images': selectedImages,
        'end_date': selectedEndDate.value?.toIso8601String(),
      };

      if (reservePriceController.text.trim().isNotEmpty) {
        auctionData['reserve_price'] = double.parse(reservePriceController.text.trim());
      }

      final response = await _apiService.createAuction(auctionData);

      if (response['id'] != null) {
        // Clear form
        clearAuctionForm();
        
        // Refresh auctions list
        await loadAuctions(refresh: true);
        
        Get.back();
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to create auction';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Place bid
  Future<bool> placeBid(int auctionId, double amount) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.placeBid(auctionId, amount);

      if (response['success'] == true) {
        // Refresh auction data
        await loadAuction(auctionId);
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to place bid';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Filter auctions
  void filterAuctions() {
    filteredAuctions.clear();
    
    for (final auction in auctions) {
      bool matchesCategory = selectedCategory.value.isEmpty || 
          auction.category.toLowerCase() == selectedCategory.value.toLowerCase();
      
      bool matchesPrice = auction.startPrice >= minPrice.value && 
          auction.startPrice <= maxPrice.value;
      
      bool matchesSearch = searchQuery.value.isEmpty || 
          auction.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          auction.description.toLowerCase().contains(searchQuery.value.toLowerCase());

      if (matchesCategory && matchesPrice && matchesSearch) {
        filteredAuctions.add(auction);
      }
    }
  }

  // Set category filter
  void setCategoryFilter(String category) {
    selectedCategory.value = category;
    filterAuctions();
  }

  // Set price range filter
  void setPriceRangeFilter(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
    filterAuctions();
  }

  // Set search query
  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterAuctions();
  }

  // Clear all filters
  void clearFilters() {
    selectedCategory.value = '';
    minPrice.value = 0.0;
    maxPrice.value = 10000.0;
    searchQuery.value = '';
    filteredAuctions.assignAll(auctions);
  }

  // Load auction data into form for editing
  void loadAuctionForEdit(AuctionModel auction) {
    nameController.text = auction.name;
    descriptionController.text = auction.description;
    startPriceController.text = auction.startPrice.toString();
    categoryController.text = auction.category;
    selectedImages.assignAll(auction.images);
    selectedEndDate.value = auction.endDate;
    endDateController.text = auction.endDate.toString().split(' ')[0];
    
    if (auction.reservePrice != null) {
      reservePriceController.text = auction.reservePrice.toString();
    }
  }

  // Clear auction form
  void clearAuctionForm() {
    nameController.clear();
    descriptionController.clear();
    startPriceController.clear();
    reservePriceController.clear();
    categoryController.clear();
    endDateController.clear();
    selectedImages.clear();
    selectedEndDate.value = null;
  }

  // Add image to selected images
  void addImage(String imagePath) {
    selectedImages.add(imagePath);
  }

  // Remove image from selected images
  void removeImage(String imagePath) {
    selectedImages.remove(imagePath);
  }

  // Set end date
  void setEndDate(DateTime date) {
    selectedEndDate.value = date;
    endDateController.text = date.toString().split(' ')[0];
  }

  // Validation methods
  bool _validateAuctionForm() {
    if (nameController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter auction name';
      return false;
    }
    if (descriptionController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter auction description';
      return false;
    }
    if (startPriceController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter start price';
      return false;
    }
    if (double.tryParse(startPriceController.text.trim()) == null) {
      errorMessage.value = 'Please enter a valid start price';
      return false;
    }
    if (categoryController.text.trim().isEmpty) {
      errorMessage.value = 'Please select a category';
      return false;
    }
    if (selectedEndDate.value == null) {
      errorMessage.value = 'Please select an end date';
      return false;
    }
    if (selectedEndDate.value!.isBefore(DateTime.now())) {
      errorMessage.value = 'End date must be in the future';
      return false;
    }
    if (selectedImages.isEmpty) {
      errorMessage.value = 'Please add at least one image';
      return false;
    }
    return true;
  }

  // Get auctions by category
  List<AuctionModel> getAuctionsByCategory(String category) {
    return auctions.where((auction) => auction.category == category).toList();
  }

  // Get active auctions
  List<AuctionModel> getActiveAuctions() {
    return auctions.where((auction) => auction.isAvailable).toList();
  }

  // Get ending soon auctions
  List<AuctionModel> getEndingSoonAuctions() {
    final now = DateTime.now();
    final endingSoon = auctions.where((auction) => 
        auction.isAvailable && 
        auction.endDate.difference(now).inDays <= 3
    ).toList();
    
    endingSoon.sort((a, b) => a.endDate.compareTo(b.endDate));
    return endingSoon;
  }

  // Show error snackbar
  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  // Show success snackbar
  void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
} 