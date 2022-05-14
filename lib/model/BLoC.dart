import 'dart:async';

import 'package:pos_hall/API.dart';

import '../login/Orders.dart';
import 'Imports.dart';

// import '../login/User.dart';

class BLoC {

  late Timer time;

  List<Orders> _orders = [];

  final _ordersSubject = BehaviorSubject<UnmodifiableListView<Orders>>();

  Stream<UnmodifiableListView<Orders>> get OrdersStream => _ordersSubject.stream;

  Future<Null> getOrders() async {
    // MenuItem(item_name: 'fai')
    Response response = await post(Uri.parse(API.hallOrders), headers: {
      "Authorization":
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NWIzODg2NC03OWVjLTRkMWItYmRhMy0zNGYyNjBhNDdjZDIiLCJqdGkiOiIwMDFmN2QxNDQ1ODQwOWM4ZjBjYzA0YTMyOTU2NzRlZmE0YmZhOTA1NjkwMjg4YWI4ODQyOGY5ZWM2ZTRmM2VjODAxNTg2ZjcxOWM3NmI3ZSIsImlhdCI6MTY0NjA0NDg1Ni42MTM5NjIsIm5iZiI6MTY0NjA0NDg1Ni42MTM5NjgsImV4cCI6MTY3NzU4MDg1Ni42MDMyNzMsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.wR8B1YhfUy7xZH5pvOUJlnz4gRTwE7y1JwJ5lfOIVcB9Bt8apKlLftsyGZeeT8mYJ8lfj0_zhlP5G5Ybgs8Yh7jayfNLXYhylMyDdfTVNW-mNklv55iLLiH1GQ_7kuXZHmq9CQSMaH6aTh0PxruQY7U9KoX-7k2IGsa4s1GrRMb2A-Zsp22z8d2b2YYwql1sqthXG9ilolJ2Qu6l7jyTmN2RxQbGTaEVnZTy1EM2ahwrpXvtdzJxenCWzX9ZqSF3RxHmouJfqLkOALEq6nMdZyj5h5uLhKyFtKB-dIRe1AKN1aaREV5thHWafuVmDhZPHDsZPpgdjEKqzANYt40V8AFi14CzhxSBQzJWQd6OVYQ2vMB7TqBJHfArXWH_Ua1OkZALAzAe77MCQr_SdnHGeMDfyl7emFrVQYg1aYDYFNt-yyTqrJTy9wa6IficXDRJDfQjA2mrlxl1LXjFBh0CfqJ19M1BfQjLixtQc1uBVeMYdwAu88iohfB0m59IYeAPy0C8MH1nklzCkzeAS70i28TY8jPg2ibV3DRvQUGfmQe93wg-QYYfZaes0X5U6m-I5_tZ5ZjizBRAd62Bg4VUUn8DEfDfBUJx3ZHel6d0GK6YzO2pWZmqDrHx2D8n8aorDf_I9N4gtMz5F9ikmeqn7A-hFv4Yj99s_kq3emDRyNU"
    },
        body: {
          'branch' : 1.toString(),
        });
    print(response.body);
    Map<String, dynamic> data = json.decode(response.body);

    _orders =
        (data['orders'] as List).map((v) => Orders.fromJson(v)).toList();

    _ordersSubject.add(UnmodifiableListView(_orders));
  }

  BLoC() {
    time = Timer.periodic(Duration(seconds: 5), (timer) {
      getOrders();
    });
  }
}
