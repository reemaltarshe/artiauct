import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/services/api_service.dart';

class CommentController extends GetxController {
  final ApiService _apiService = ApiService();
  
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> comments = <Map<String, dynamic>>[].obs;
  final RxString errorMessage = ''.obs;
  final RxInt currentProductId = 0.obs;

  // Form controllers
  final TextEditingController commentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }

  // Load comments for a product
  Future<void> loadComments(int productId) async {
    currentProductId.value = productId;
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.getComments(productId);
      
      if (response['results'] != null) {
        final List<Map<String, dynamic>> newComments = (response['results'] as List)
            .map((comment) => comment as Map<String, dynamic>)
            .toList();

        comments.clear();
        comments.addAll(newComments);
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Add comment
  Future<bool> addComment(int productId, String comment) async {
    if (comment.trim().isEmpty) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.addComment(productId, comment);

      if (response['success'] == true) {
        // Add comment to local list
        final newComment = {
          'id': response['id'],
          'comment': comment,
          'user_name': response['user_name'] ?? 'You',
          'user_image': response['user_image'],
          'created_at': DateTime.now().toIso8601String(),
        };
        comments.insert(0, newComment);
        
        // Clear input
        commentController.clear();
        
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to add comment';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Add comment for current product
  Future<void> addCurrentComment() async {
    if (currentProductId.value == 0) return;
    
    final success = await addComment(currentProductId.value, commentController.text.trim());
    if (!success) {
      showError(errorMessage.value);
    }
  }

  // Delete comment
  Future<bool> deleteComment(int commentId) async {
    try {
      // Remove from local list
      comments.removeWhere((comment) => comment['id'] == commentId);
      return true;
    } catch (e) {
      errorMessage.value = 'Failed to delete comment';
      return false;
    }
  }

  // Get comment count
  int get commentCount => comments.length;

  // Get comments by user
  List<Map<String, dynamic>> getCommentsByUser(String userName) {
    return comments.where((comment) => comment['user_name'] == userName).toList();
  }

  // Get recent comments
  List<Map<String, dynamic>> getRecentComments() {
    final sortedComments = List<Map<String, dynamic>>.from(comments);
    sortedComments.sort((a, b) {
      final aTime = DateTime.parse(a['created_at']);
      final bTime = DateTime.parse(b['created_at']);
      return bTime.compareTo(aTime);
    });
    return sortedComments.take(10).toList();
  }

  // Search comments
  List<Map<String, dynamic>> searchComments(String query) {
    if (query.isEmpty) return comments;
    
    return comments.where((comment) =>
        comment['comment'].toLowerCase().contains(query.toLowerCase()) ||
        comment['user_name'].toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Clear all comments
  void clearComments() {
    comments.clear();
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