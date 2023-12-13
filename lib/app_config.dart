import 'package:untitled/member/repository/member_repository.dart';
import 'package:untitled/member/repository/memory_member_repository_impl.dart';
import 'package:untitled/member/service/member_service.dart';
import 'package:untitled/member/service/member_service_impl.dart';
import 'package:untitled/order/discount_policy.dart';
import 'package:untitled/order/fix_discount_policy.dart';
import 'package:untitled/order/service/order_service.dart';
import 'package:untitled/order/service/order_service_impl.dart';

class AppConfig {
  MemberRepository getMemberRepository(){
    return MemoryMemberRepositoryImpl();
  }

  MemberService getMemberService(){
    return MemberServiceImpl(getMemberRepository());
  }

  DiscountPoilcy getDiscountPolicy(){
    return FixDiscountPolicy();
  }

  OrderService getOrderService(){
    return OrderServiceImpl(getMemberRepository(), getDiscountPolicy());
  }
}

