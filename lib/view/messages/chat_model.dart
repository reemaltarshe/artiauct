class Message {
  final int id;
  final String text;
  final bool recived;
  final String timeStamp;

  Message(
      {required this.id,
        required this.text,
        required this.recived,
        required this.timeStamp});
}
List<Message> messages=[
  Message(id: 0,recived: false,text: "Hi I want to order two Christmas Candles Please",timeStamp: '4:30'),
  Message(id: 1,recived: true,text: "Ofcourse,Send me the Location",timeStamp: '4:33'),
  Message(id: 2,recived: false,text: "Homs,Akrama ",timeStamp: '4:40'),


];