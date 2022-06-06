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
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Njc0YjRkMS03YWQwLTRlNGQtYjU0ZC1hMDAzMTM1YTVkMjIiLCJqdGkiOiJlYWIxMDI2MTRiZDVjYTFkMjc2NTU3OTRkOWZkYWQ4ZDdjNjQyNTllY2JhNTMzYzk1Y2M3ZGU2OWZkNjU1YTY1YTVlZmY3OTMzNWZhMGNkYiIsImlhdCI6MTY1NDI4MDA1Ny45NzY5MSwibmJmIjoxNjU0MjgwMDU3Ljk3NjkxMSwiZXhwIjoxNjg1ODE2MDU3Ljk3NDE5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.UpZL-qcaBERpVqwnxTxwlZmH6sodLgAYosWOzL3Y7OKRjN9FdzMYkqycxAqInFAu7-ugYsM_KBN9eSLTzFa9gf0BGQJug-mSU6tAAyCE--XZL-d1y81IB8qrdUVSbm3MBFFgAAIOHe3hdrXIbIr6XR9SSCTny_qNb3IyXLCXYU5GpbP5XRK4jLzuds2WVxI8nHDmUSugilwLkzK94-VDo2o2SqqA1oVCHc6wo7mXy33hK3BiDJz8vOZB3HnLefpkdBCJsP6AK7AWAgiRzWd3LHykPMOgR4S9pJ6X3k44Ie63uDfKTt5pbyotWIGmqV1kAZPit6mWuX-eEfxPMZpkwHjPF20KEAqYiRJSbCUwxpL6d4prrt6343fY8j3DPqEgDeWOD6TI9PjgwNmczugp7QlXGhSx-iUHWSRELl_nzQF5Fb35_BTtQLvMmODrm0BgQ7zFGqLWW_2jTSnJjMbF_ArabHwrkoVj1U8WQLzixjKbhNvC779Mk5tcDkqN5dgXHQt2uv2f971izhNBAT2l26dEhBXI_lTCXtALWFIl46yE8L_zUQGQ-fsqeV__1nKtsR3elquHnhsuswx-iYcGSCk0-3cylIrONRwL726AusX6rthoIdglRRo994FFeiXHvUyZ7PBrEuPNpK4oxuCqUx4F2pTt4TX8irgs0G91bnU"    },
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
