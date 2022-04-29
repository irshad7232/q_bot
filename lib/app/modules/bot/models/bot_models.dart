class Chat {
  final int id;
  final String message;
  final DateTime dateTime;
  final ChatType chatType;

  Chat({
    required this.id,
    required this.message,
    required this.dateTime,
    required this.chatType,
  });
}

enum ChatType {
  bot,
  user,
  sys,
}
