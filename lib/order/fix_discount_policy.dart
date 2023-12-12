import 'package:untitled/member/grade.dart';
import 'package:untitled/member/member.dart';
import 'package:untitled/order/discount_policy.dart';

class FixDiscountPolicy implements DiscountPoilcy {
  // 고정 금액 할인 - VIP 면 1,500원 할인
  int discountFixAmount = 1500;
  @override
  int discount(Member member, int price) {
    // 만약 ~ VIP 등급 이라면
    if(member.grade == Grade.VIP) {
      return discountFixAmount;
    }
    return 0;
  }
}