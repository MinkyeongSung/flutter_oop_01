import 'package:untitled/member/grade.dart';
import 'package:untitled/member/member.dart';
import 'package:untitled/order/discount_policy.dart';

class PercentDiscountPolicy implements DiscountPoilcy {
  // 정율 할인

  double discountPercent = 10; // 10%할인

  @override
  int discount(Member member, int price) {
    if (member.grade == Grade.VIP) {
      return (price * (discountPercent / 100)).toInt(); // 명시적 형 변환
    }
    return 0;
  }
}
