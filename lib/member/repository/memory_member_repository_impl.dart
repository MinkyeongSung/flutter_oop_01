import 'package:untitled/member/member.dart';
import 'package:untitled/member/repository/member_repository.dart';

// 메모리에 회원에 대한 데이터를 저장
// 1. dart에서 싱글톤 객체로 설계 하기
class MemoryMemberRepositoryImpl implements MemberRepository {
  Map<num, Member> _memberStore = {};

  // 2. 인스턴스를 저장할 스테이틱 변수 선언
  static MemoryMemberRepositoryImpl?_instantce;

  // 1. 생성자를 만들어서 외부에서 호출하지 못하도록 설계. (언더바)
  MemoryMemberRepositoryImpl._internal(); // 네임드 생성자 만들기

  // 3. 외부에서 호출 할 수 있는 팩토리 키워드 생성자를 만들어 준다.
  factory MemoryMemberRepositoryImpl(){
    if(_instantce == null){
      _instantce = MemoryMemberRepositoryImpl._internal(); // 생성자 호출
    }
    return _instantce!;
  }

  @override
  Member? findById(num memberId) {
    return _memberStore[memberId];
  }

  @override
  void save(Member member) {
    _memberStore[member.id] = member;
  }
}
