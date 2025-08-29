import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/services/api_service.dart';
import 'package:handmade/data/models/product_model.dart';

class ProductController extends GetxController {
  final ApiService _apiService = ApiService();
  
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  final Rx<ProductModel?> selectedProduct = Rx<ProductModel?>(null);
  final RxString errorMessage = ''.obs;
  final RxString selectedCategory = ''.obs;
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 1000.0.obs;
  final RxString searchQuery = ''.obs;

  // Form controllers for adding/editing products
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final RxList<String> selectedImages = <String>[].obs;

  // Pagination
  final RxInt currentPage = 1.obs;
  final RxBool hasMoreData = true.obs;
  final RxInt totalProducts = 0.obs;

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
    loadProducts();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    categoryController.dispose();
    super.onClose();
  }

  // Load products from API
  Future<void> loadProducts({bool refresh = false}) async {
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
      if (maxPrice.value < 1000) {
        filters['max_price'] = maxPrice.value;
      }

      final response = await _apiService.getProducts(filters: filters);
      
      if (response['results'] != null) {
        final List<ProductModel> newProducts = (response['results'] as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();

        if (refresh) {
          products.clear();
          filteredProducts.clear();
        }

        products.addAll(newProducts);
        filteredProducts.addAll(newProducts);

        totalProducts.value = response['count'] ?? 0;
        hasMoreData.value = newProducts.length == 20; // Assuming page size is 20
        currentPage.value++;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Load single product
  Future<void> loadProduct(int productId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.getProduct(productId);
      selectedProduct.value = ProductModel.fromJson(response);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Create new product
  Future<bool> createProduct() async {
    if (!_validateProductForm()) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final productData = {
        'name': nameController.text.trim(),
        'description': descriptionController.text.trim(),
        'price': double.parse(priceController.text.trim()),
        'category': categoryController.text.trim(),
        'images': selectedImages,
      };

      final response = await _apiService.createProduct(productData);

      if (response['id'] != null) {
        // Clear form
        clearProductForm();
        
        // Refresh products list
        await loadProducts(refresh: true);
        
        Get.back();
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to create product';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Update product
  Future<bool> updateProduct(int productId) async {
    if (!_validateProductForm()) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final productData = {
        'name': nameController.text.trim(),
        'description': descriptionController.text.trim(),
        'price': double.parse(priceController.text.trim()),
        'category': categoryController.text.trim(),
        'images': selectedImages,
      };

      final response = await _apiService.updateProduct(productId, productData);

      if (response['success'] == true) {
        // Clear form
        clearProductForm();
        
        // Refresh products list
        await loadProducts(refresh: true);
        
        Get.back();
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to update product';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Delete product
  Future<bool> deleteProduct(int productId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.deleteProduct(productId);

      if (response['success'] == true) {
        // Remove from lists
        products.removeWhere((product) => product.id == productId);
        filteredProducts.removeWhere((product) => product.id == productId);
        
        Get.back();
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to delete product';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Filter products
  void filterProducts() {
    filteredProducts.clear();
    
    for (final product in products) {
      bool matchesCategory = selectedCategory.value.isEmpty || 
          product.category.toLowerCase() == selectedCategory.value.toLowerCase();
      
      bool matchesPrice = product.price >= minPrice.value && 
          product.price <= maxPrice.value;
      
      bool matchesSearch = searchQuery.value.isEmpty || 
          product.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          product.description.toLowerCase().contains(searchQuery.value.toLowerCase());

      if (matchesCategory && matchesPrice && matchesSearch) {
        filteredProducts.add(product);
      }
    }
  }

  // Set category filter
  void setCategoryFilter(String category) {
    selectedCategory.value = category;
    filterProducts();
  }

  // Set price range filter
  void setPriceRangeFilter(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
    filterProducts();
  }

  // Set search query
  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterProducts();
  }

  // Clear all filters
  void clearFilters() {
    selectedCategory.value = '';
    minPrice.value = 0.0;
    maxPrice.value = 1000.0;
    searchQuery.value = '';
    filteredProducts.assignAll(products);
  }

  // Load product data into form for editing
  void loadProductForEdit(ProductModel product) {
    nameController.text = product.name;
    descriptionController.text = product.description;
    priceController.text = product.price.toString();
    categoryController.text = product.category;
    selectedImages.assignAll(product.images);
  }

  // Clear product form
  void clearProductForm() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    categoryController.clear();
    selectedImages.clear();
  }

  // Add image to selected images
  void addImage(String imagePath) {
    selectedImages.add(imagePath);
  }

  // Remove image from selected images
  void removeImage(String imagePath) {
    selectedImages.remove(imagePath);
  }

  // Validation methods
  bool _validateProductForm() {
    if (nameController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter product name';
      return false;
    }
    if (descriptionController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter product description';
      return false;
    }
    if (priceController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter product price';
      return false;
    }
    if (double.tryParse(priceController.text.trim()) == null) {
      errorMessage.value = 'Please enter a valid price';
      return false;
    }
    if (categoryController.text.trim().isEmpty) {
      errorMessage.value = 'Please select a category';
      return false;
    }
    if (selectedImages.isEmpty) {
      errorMessage.value = 'Please add at least one image';
      return false;
    }
    return true;
  }

  // Get products by category
  List<ProductModel> getProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }

  // Get featured products (top rated)
  List<ProductModel> getFeaturedProducts() {
    final sortedProducts = List<ProductModel>.from(products);
    sortedProducts.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    return sortedProducts.take(10).toList();
  }

  // Get recent products
  List<ProductModel> getRecentProducts() {
    final sortedProducts = List<ProductModel>.from(products);
    sortedProducts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedProducts.take(10).toList();
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