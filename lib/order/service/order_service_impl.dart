import 'package:untitled/member/member.dart';
import 'package:untitled/member/repository/member_repository.dart';
import 'package:untitled/order/discount_policy.dart';
import 'package:untitled/order/order.dart';
import 'package:untitled/order/service/order_service.dart';

class OrderServiceImpl implements OrderService {
  // DIP 원칙에 따라서 추상화 된 것 선언
  MemberRepository memberRepository;
  DiscountPoilcy discountPoilcy;

  // 생성자 의존 --> DI
  OrderServiceImpl(this.memberRepository, this.discountPoilcy);

  @override
  Order createOrder(num memberId, String itemName, int itemPrice) {
    // 1. 회원을 찾아서 회원 등급을 확인한다.
    // 2. 회원 등급에 해당하는 할인 정책을 반영한다.
    Member? memberEntity = memberRepository.findById(memberId);
    // 회원 없다면 예외처리 -> 생략
    // ! null 억제 연산자 - memberEntity 는 절대 null이 아니라고 강제하는것.
    int discountPrice = discountPoilcy.discount(memberEntity!, itemPrice);

    return Order(
        memberId: memberId,
        itemName: itemName,
        itemPrice: itemPrice,
        discountPrice: discountPrice);
  }
}
