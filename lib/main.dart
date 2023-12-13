import 'package:flutter/material.dart';
import 'package:untitled/app_config.dart';
import 'package:untitled/member/grade.dart';
import 'package:untitled/member/member.dart';
import 'package:untitled/member/repository/member_repository.dart';
import 'package:untitled/member/service/member_service.dart';
import 'package:untitled/member/service/member_service_impl.dart';
import 'package:untitled/order/discount_policy.dart';
import 'package:untitled/order/fix_discount_policy.dart';
import 'package:untitled/order/order.dart';
import 'package:untitled/order/service/order_service.dart';

void main() {
  // 관심 분리
  // Appconfing 설정 파일만 변경해 주면 된다.
  AppConfig appConfig = AppConfig();

  MemberRepository memberRepository = appConfig.getMemberRepository();
  MemberService memberService = MemberServiceImpl(memberRepository);

  DiscountPoilcy discountPoilcy = FixDiscountPolicy();
  OrderService orderService = appConfig.getOrderService();

  // mock 유저 생성
  Member newMember = Member(id: 200, name: '야스오', grade: Grade.VIP);
  // 회원가입 처리
  memberService.signUp(newMember); // 메모리 저장
  // 회원 조회
  Member? findMember = memberService.findByIdMember(200);
  print(findMember.toString());

  Order order1 = orderService.createOrder(findMember?.id ?? 200, '맥북', 2000000);
  print(order1);
}
