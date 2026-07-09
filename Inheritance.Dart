Stream<int> ticks=Stream.periodic(Duration(seconds: 1), (x) => x).take(5);


void main()  {
  ticks.listen((event) {
    print(event);
  });
  
}
