// 역할
import '../member.dart';

abstract class MemberService {
  void signUp(Member member);
  Member? findByIdMember(num memberId);
}