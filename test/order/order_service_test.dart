import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/member/grade.dart';
import 'package:untitled/member/member.dart';
import 'package:untitled/member/repository/member_repository.dart';
import 'package:untitled/member/repository/memory_member_repository_impl.dart';
import 'package:untitled/order/discount_policy.dart';
import 'package:untitled/order/fix_discount_policy.dart';
import 'package:untitled/order/order.dart';
import 'package:untitled/order/percent_discount_policy.dart';
import 'package:untitled/order/service/order_service.dart';
import 'package:untitled/order/service/order_service_impl.dart';

void main() {
  // late 늦게 초기화 되서 컴파일 시점에 오류가 안남
  late MemberRepository memberRepository;
  late DiscountPoilcy discountPoilcy;
  late OrderService orderService;

  // 매번 실행시 마다 초기화 값이 필요 하다면
  setUp(() {
    memberRepository = MemoryMemberRepositoryImpl();
    // discountPoilcy = FixDiscountPolicy();
    discountPoilcy = PercentDiscountPolicy();
    orderService = OrderServiceImpl(memberRepository, discountPoilcy);
  });

  test('주문 테스트 1', () {
    // given
    Member member = Member(id: 100, name: '홍길동', grade: Grade.VIP);
    memberRepository.save(member);

    // when
    // 고정 금액 할인 테스트
    discountPoilcy = FixDiscountPolicy();
    Order order1 = orderService.createOrder(member.id, '맥북', 2000000);
    print(order1.toString());
    print(order1.calculateDiscount());

    // then
    expect(order1.discountPrice, 2000000);
    expect(order1.calculateDiscount(), 1800000);
  });

  test('주문 테스트 2', () {});
}