import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/services/api_service.dart';
import 'package:handmade/view/messages/chat_model.dart';

class MessageController extends GetxController {
  final ApiService _apiService = ApiService();
  
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<ChatModel> messages = <ChatModel>[].obs;
  final RxList<ChatModel> conversations = <ChatModel>[].obs;
  final RxString errorMessage = ''.obs;
  final RxString selectedUserId = ''.obs;

  // Form controllers
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadConversations();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  // Load conversations list
  Future<void> loadConversations() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.getMessages();
      
      if (response['results'] != null) {
        final List<ChatModel> newConversations = (response['results'] as List)
            .map((conversation) => ChatModel.fromJson(conversation))
            .toList();

        conversations.clear();
        conversations.addAll(newConversations);
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Load chat messages for a specific user
  Future<void> loadChatMessages(int userId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.getChatMessages(userId);
      
      if (response['results'] != null) {
        final List<ChatModel> newMessages = (response['results'] as List)
            .map((message) => ChatModel.fromJson(message))
            .toList();

        messages.clear();
        messages.addAll(newMessages);
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Send message
  Future<bool> sendMessage(int userId, String message) async {
    if (message.trim().isEmpty) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.sendMessage(userId, message);

      if (response['success'] == true) {
        // Add message to local list
        final newMessage = ChatModel(
          message: message,
          isMe: true,
          time: DateTime.now(),
        );
        messages.add(newMessage);
        
        // Clear input
        messageController.clear();
        
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Failed to send message';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Send message from current user
  Future<void> sendCurrentMessage() async {
    if (selectedUserId.value.isEmpty) return;
    
    final userId = int.tryParse(selectedUserId.value);
    if (userId == null) return;

    final success = await sendMessage(userId, messageController.text.trim());
    if (!success) {
      showError(errorMessage.value);
    }
  }

  // Set selected user for chat
  void setSelectedUser(String userId) {
    selectedUserId.value = userId;
    final userIdInt = int.tryParse(userId);
    if (userIdInt != null) {
      loadChatMessages(userIdInt);
    }
  }

  // Get conversation by user ID
  ChatModel? getConversationByUserId(String userId) {
    try {
      return conversations.firstWhere((conv) => conv.userId == userId);
    } catch (e) {
      return null;
    }
  }

  // Get unread message count
  int getUnreadCount(String userId) {
    try {
      final conversation = conversations.firstWhere((conv) => conv.userId == userId);
      return conversation.unreadCount ?? 0;
    } catch (e) {
      return 0;
    }
  }

  // Mark conversation as read
  Future<void> markAsRead(String userId) async {
    try {
      final conversation = conversations.firstWhere((conv) => conv.userId == userId);
      conversation.unreadCount = 0;
      conversations.refresh();
    } catch (e) {
      print('Error marking conversation as read: $e');
    }
  }

  // Get recent conversations
  List<ChatModel> getRecentConversations() {
    final sortedConversations = List<ChatModel>.from(conversations);
    sortedConversations.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
    return sortedConversations.take(10).toList();
  }

  // Search conversations
  List<ChatModel> searchConversations(String query) {
    if (query.isEmpty) return conversations;
    
    return conversations.where((conversation) =>
        conversation.userName.toLowerCase().contains(query.toLowerCase()) ||
        conversation.lastMessage.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Delete conversation
  Future<bool> deleteConversation(String userId) async {
    try {
      conversations.removeWhere((conv) => conv.userId == userId);
      return true;
    } catch (e) {
      errorMessage.value = 'Failed to delete conversation';
      return false;
    }
  }

  // Clear all messages
  void clearMessages() {
    messages.clear();
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