class Message {
  final String? id;
  final String? content;
  final String? senderId;
  final String? receiverId;
  final DateTime? timeStamp;

  Message(
      {this.id, this.content, this.senderId, this.receiverId, this.timeStamp});

  // Convert a Message object to a Map (for Firestore or JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'senderId': senderId,
      'receiverId': receiverId,
      'timeStamp': timeStamp?.toIso8601String(),
    };
  }

  // Create a Message object from a Map (from Firestore or JSON)
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      content: map['content'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      timeStamp:
          map['timeStamp'] != null ? DateTime.parse(map['timeStamp']) : null,
    );
  }
}
