// 메모리에 회원에 대한 데이터를 저장
import 'package:untitled/member/member.dart';
import 'package:untitled/member/repository/member_repository.dart';

class MemoryMemberRepositoryImpl implements MemberRepository {
  Map<num, Member> memberStore = {};

  @override
  Member? findById(num memberId) {
    return memberStore[memberId];
  }

  @override
  void save(Member member) {
    memberStore[member.id] = member;
  }
}
