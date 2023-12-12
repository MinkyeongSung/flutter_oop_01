import 'package:untitled/member/member.dart';

abstract class DiscountPoilcy {
  // 할인 처리 - 멤버의 등급에 따라 할인 금액 결정(고정, 정율)
  int discount(Member member, int price);


}