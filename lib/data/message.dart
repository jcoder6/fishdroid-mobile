// To parse this JSON data, do
//
//     final sendMessage = sendMessageFromJson(jsonString);

import 'dart:convert';

SendMessage sendMessageFromJson(String str) => SendMessage.fromJson(json.decode(str));

String sendMessageToJson(SendMessage data) => json.encode(data.toJson());

class SendMessage {
    String email;
    String message;
    String isRead;

    SendMessage({
        required this.email,
        required this.message,
        required this.isRead,
    });

    factory SendMessage.fromJson(Map<String, dynamic> json) => SendMessage(
        email: json["email"],
        message: json["message"],
        isRead: json["is_read"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "message": message,
        "is_read": isRead,
    };
}
