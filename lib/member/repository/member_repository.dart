import 'package:untitled/member/member.dart';

abstract class MemberRepository {
  void save(Member member);

  Member? findById(num memberId); // DB, 메모리, 없는 경우가 있다.
}
