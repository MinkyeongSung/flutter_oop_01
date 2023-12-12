import 'package:untitled/order/order.dart';

abstract class OrderService{
  // 주문 생성
  Order createOrder(num memberId, String itemName, int itemPrice);
}