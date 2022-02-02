class TimeValueObject{
  DateTime timestamp;
  double value;

  TimeValueObject(this.timestamp, this.value);

  TimeValueObject.fromJson(Map<String,dynamic> map)
      :timestamp=DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
       value=map['value'];

  Map<String, dynamic> toJson() => {
    'timestamp': timestamp.millisecondsSinceEpoch,
    'value': value
  };


}