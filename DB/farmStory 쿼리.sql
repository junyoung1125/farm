#내용 : FarmStory 프로젝트 테이블 설계 


-- 사용자 생성 및 권한부여
DROP USER IF EXISTS 'farmStory'@'%';
CREATE USER 'farmStory'@'%' IDENTIFIED BY '1q2w3e';
GRANT ALL PRIVILEGES ON `farmStory`.* TO 'farmStory'@'%';
FLUSH PRIVILEGES;


# 게시판 임시 데이터 - uid = admin
INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES 
('notice', '공지사항 안내', '새로운 업데이트 공지드립니다.', 2, 0, 150, 'admin', '192.168.0.1', NOW()),
('free', '오늘의 일상', '오늘은 유난히 기분이 좋은 날이네요!', 5, 0, 87, 'admin', '203.0.113.5', NOW()),
('free', '좋은 책 추천해주세요', '자기계발 관련 좋은 책 추천받습니다.', 3, 0, 120, 'admin', '198.51.100.23', NOW()),
('qna', '자바 질문 있습니다.', '자바에서 인터페이스와 추상 클래스의 차이점이 뭔가요?', 1, 0, 45, 'admin', '172.16.254.3', NOW()),
('qna', 'MySQL 쿼리 최적화', '대량 데이터를 처리할 때 성능을 올릴 방법이 있을까요?', 7, 0, 250, 'admin', '203.0.113.42', NOW()),
('free', '유럽 여행지 추천', '다음 달에 유럽 여행을 가려고 하는데 어디가 좋을까요?', 10, 0, 300, 'admin', '198.51.100.7', NOW());

INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES 
('notice', '서비스 점검 예정', '내일 새벽 2시부터 4시까지 서버 점검이 진행됩니다.', 3, 0, 180, 'admin', '192.168.0.2', NOW()),
('free', '오늘 점심 뭐 드셨나요?', '점심 메뉴 고민 중인데 추천 좀 해주세요!', 4, 0, 95, 'admin', '203.0.113.10', NOW()),
('free', '좋은 음악 추천해주세요', '요즘 들을만한 편안한 음악 추천 부탁드립니다.', 2, 0, 60, 'admin', '198.51.100.30', NOW()),
('qna', 'Spring Boot 질문', 'Spring Boot에서 @Transactional의 역할이 궁금합니다.', 6, 0, 140, 'admin', '172.16.254.10', NOW()),
('qna', 'CSS flexbox 질문', 'flex-grow와 flex-shrink의 차이점이 뭔가요?', 1, 0, 50, 'admin', '203.0.113.15', NOW()),
('free', '요즘 재미있는 드라마 추천', '최근 본 드라마 중 추천할 만한 게 있을까요?', 5, 0, 110, 'admin', '198.51.100.40', NOW()),
('free', '여행 가고 싶은 곳', '여행 가고 싶은 곳 리스트를 작성 중입니다.', 3, 0, 75, 'admin', '203.0.113.25', NOW()),
('notice', '신규 기능 업데이트', '이번 업데이트에서 추가된 주요 기능을 안내드립니다.', 2, 0, 200, 'admin', '192.168.0.3', NOW()),
('qna', 'Python vs Java', '데이터 분석에는 Python이 더 좋을까요, Java가 더 좋을까요?', 8, 0, 220, 'admin', '172.16.254.20', NOW()),
('free', '건강 관리 방법', '운동, 식습관 관리 등 건강을 위한 팁 공유해요.', 4, 0, 130, 'admin', '203.0.113.50', NOW());

-- 카테고리 공지사항
INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES 
('notice', '서비스 점검 완료', '예정된 서버 점검이 성공적으로 완료되었습니다.', 1, 0, 160, 'admin', '192.168.0.4', NOW()),
('notice', '보안 업데이트 안내', '보안 강화를 위한 업데이트가 적용되었습니다.', 2, 0, 175, 'admin', '203.0.113.12', NOW()),
('notice', '이벤트 공지', '다음 주부터 특별 이벤트가 진행됩니다.', 3, 0, 190, 'admin', '198.51.100.5', NOW()),
('notice', '점검 일정 변경', '서버 점검 일정이 변경되었습니다. 새로운 일정을 확인하세요.', 1, 0, 145, 'admin', '172.16.254.8', NOW()),
('notice', '이용 약관 개정', '새로운 이용 약관이 적용되었으니 확인 부탁드립니다.', 4, 0, 210, 'admin', '203.0.113.22', NOW()),
('notice', '긴급 공지', '예기치 않은 장애로 인해 일부 서비스가 제한될 수 있습니다.', 5, 0, 220, 'admin', '192.168.0.5', NOW()),
('notice', '정기 점검 안내', '매월 첫째 주 일요일 정기 점검이 진행됩니다.', 3, 0, 180, 'admin', '203.0.113.30', NOW()),
('notice', '신규 서비스 출시', '새로운 기능이 추가된 신규 서비스를 소개합니다.', 6, 0, 250, 'admin', '198.51.100.15', NOW()),
('notice', '계정 보안 강화', '2단계 인증 기능이 추가되었습니다.', 2, 0, 195, 'admin', '172.16.254.12', NOW()),
('notice', '고객센터 운영 변경', '고객센터 운영 시간이 변경되었습니다.', 1, 0, 140, 'admin', '203.0.113.35', NOW()),
('notice', '데이터 백업 일정', '서버 데이터 백업이 진행될 예정입니다.', 4, 0, 210, 'admin', '192.168.0.6', NOW()),
('notice', '모바일 앱 업데이트', '앱의 최신 업데이트 내용을 확인하세요.', 5, 0, 230, 'admin', '203.0.113.40', NOW()),
('notice', '연말 이벤트 안내', '연말 맞이 특별 이벤트를 진행합니다.', 3, 0, 185, 'admin', '198.51.100.20', NOW()),
('notice', '서비스 장애 보고', '일부 사용자에게 서비스 지연이 발생했습니다.', 2, 0, 175, 'admin', '172.16.254.15', NOW()),
('notice', '이메일 인증 필수화', '보안 강화를 위해 이메일 인증이 필수가 됩니다.', 6, 0, 240, 'admin', '203.0.113.45', NOW()),
('notice', '긴급 서버 패치', '긴급 서버 패치가 적용되었습니다.', 2, 0, 170, 'admin', '192.168.0.7', NOW()),
('notice', '사용자 피드백 반영', '여러분의 의견을 반영한 업데이트가 있었습니다.', 5, 0, 200, 'admin', '203.0.113.50', NOW()),
('notice', '새로운 FAQ 추가', '자주 묻는 질문(FAQ)이 업데이트되었습니다.', 1, 0, 130, 'admin', '198.51.100.25', NOW()),
('notice', '결제 시스템 변경', '더 안전한 결제 시스템이 도입되었습니다.', 4, 0, 190, 'admin', '172.16.254.18', NOW()),
('notice', '서비스 이용 가이드', '초보자를 위한 서비스 이용 가이드가 추가되었습니다.', 3, 0, 180, 'admin', '203.0.113.55', NOW()),
('notice', '보안 정책 개편', '보안 정책이 일부 변경되었습니다.', 2, 0, 175, 'admin', '192.168.0.8', NOW()),
('notice', '커뮤니티 규칙 변경', '커뮤니티 이용 수칙이 개정되었습니다.', 5, 0, 220, 'admin', '203.0.113.60', NOW()),
('notice', '고객 설문 조사', '서비스 개선을 위한 설문조사에 참여해주세요.', 3, 0, 185, 'admin', '198.51.100.30', NOW()),
('notice', '긴급 업데이트', '일부 보안 취약점이 패치되었습니다.', 6, 0, 250, 'admin', '172.16.254.22', NOW()),
('notice', '회원 혜택 안내', '회원 전용 혜택이 새롭게 추가되었습니다.', 2, 0, 160, 'admin', '203.0.113.65', NOW()),
('notice', '서버 응답 속도 개선', '서버 최적화로 응답 속도가 향상되었습니다.', 4, 0, 200, 'admin', '192.168.0.9', NOW()),
('notice', '공지사항 통합 관리', '공지사항 관리 시스템이 개편되었습니다.', 1, 0, 140, 'admin', '203.0.113.70', NOW()),
('notice', '이벤트 마감 안내', '현재 진행 중인 이벤트의 마감일이 다가오고 있습니다.', 5, 0, 230, 'admin', '198.51.100.35', NOW()),
('notice', '시스템 성능 향상', '백엔드 시스템이 최적화되었습니다.', 3, 0, 190, 'admin', '172.16.254.25', NOW()),
('notice', '문의 처리 속도 향상', '고객 문의 처리 속도가 개선되었습니다.', 2, 0, 175, 'admin', '203.0.113.75', NOW());

# grow
INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES
('grow', '서비스 점검 완료', '예정된 서버 점검이 성공적으로 완료되었습니다.', 1, 0, 160, 'admin', '192.168.0.4', NOW()),
('grow', '보안 업데이트 안내', '보안 강화를 위한 업데이트가 적용되었습니다.', 2, 0, 175, 'admin', '203.0.113.12', NOW()),
('grow', '이벤트 공지', '다음 주부터 특별 이벤트가 진행됩니다.', 3, 0, 190, 'admin', '198.51.100.5', NOW()),
('grow', '점검 일정 변경', '서버 점검 일정이 변경되었습니다. 새로운 일정을 확인하세요.', 1, 0, 145, 'admin', '172.16.254.8', NOW()),
('grow', '이용 약관 개정', '새로운 이용 약관이 적용되었으니 확인 부탁드립니다.', 4, 0, 210, 'admin', '203.0.113.22', NOW()),
('grow', '긴급 공지', '예기치 않은 장애로 인해 일부 서비스가 제한될 수 있습니다.', 5, 0, 220, 'admin', '192.168.0.5', NOW()),
('grow', '정기 점검 안내', '매월 첫째 주 일요일 정기 점검이 진행됩니다.', 3, 0, 180, 'admin', '203.0.113.30', NOW()),
('grow', '신규 서비스 출시', '새로운 기능이 추가된 신규 서비스를 소개합니다.', 6, 0, 250, 'admin', '198.51.100.15', NOW()),
('grow', '계정 보안 강화', '2단계 인증 기능이 추가되었습니다.', 2, 0, 195, 'admin', '172.16.254.12', NOW()),
('grow', '고객센터 운영 변경', '고객센터 운영 시간이 변경되었습니다.', 1, 0, 140, 'admin', '203.0.113.35', NOW()),
('grow', '데이터 백업 일정', '서버 데이터 백업이 진행될 예정입니다.', 4, 0, 210, 'admin', '192.168.0.6', NOW()),
('grow', '모바일 앱 업데이트', '앱의 최신 업데이트 내용을 확인하세요.', 5, 0, 230, 'admin', '203.0.113.40', NOW()),
('grow', '연말 이벤트 안내', '연말 맞이 특별 이벤트를 진행합니다.', 3, 0, 185, 'admin', '198.51.100.20', NOW()),
('grow', '서비스 장애 보고', '일부 사용자에게 서비스 지연이 발생했습니다.', 2, 0, 175, 'admin', '172.16.254.15', NOW()),
('grow', '이메일 인증 필수화', '보안 강화를 위해 이메일 인증이 필수가 됩니다.', 6, 0, 240, 'admin', '203.0.113.45', NOW()),
('grow', '긴급 서버 패치', '긴급 서버 패치가 적용되었습니다.', 2, 0, 170, 'admin', '192.168.0.7', NOW()),
('grow', '사용자 피드백 반영', '여러분의 의견을 반영한 업데이트가 있었습니다.', 5, 0, 200, 'admin', '203.0.113.50', NOW()),
('grow', '새로운 FAQ 추가', '자주 묻는 질문(FAQ)이 업데이트되었습니다.', 1, 0, 130, 'admin', '198.51.100.25', NOW()),
('grow', '결제 시스템 변경', '더 안전한 결제 시스템이 도입되었습니다.', 4, 0, 190, 'admin', '172.16.254.18', NOW()),
('grow', '서비스 이용 가이드', '초보자를 위한 서비스 이용 가이드가 추가되었습니다.', 3, 0, 180, 'admin', '203.0.113.55', NOW()),
('grow', '보안 정책 개편', '보안 정책이 일부 변경되었습니다.', 2, 0, 175, 'admin', '192.168.0.8', NOW()),
('grow', '커뮤니티 규칙 변경', '커뮤니티 이용 수칙이 개정되었습니다.', 5, 0, 220, 'admin', '203.0.113.60', NOW()),
('grow', '고객 설문 조사', '서비스 개선을 위한 설문조사에 참여해주세요.', 3, 0, 185, 'admin', '198.51.100.30', NOW()),
('grow', '긴급 업데이트', '일부 보안 취약점이 패치되었습니다.', 6, 0, 250, 'admin', '172.16.254.22', NOW()),
('grow', '회원 혜택 안내', '회원 전용 혜택이 새롭게 추가되었습니다.', 2, 0, 160, 'admin', '203.0.113.65', NOW()),
('grow', '서버 응답 속도 개선', '서버 최적화로 응답 속도가 향상되었습니다.', 4, 0, 200, 'admin', '192.168.0.9', NOW()),
('grow', '공지사항 통합 관리', '공지사항 관리 시스템이 개편되었습니다.', 1, 0, 140, 'admin', '203.0.113.70', NOW()),
('grow', '이벤트 마감 안내', '현재 진행 중인 이벤트의 마감일이 다가오고 있습니다.', 5, 0, 230, 'admin', '198.51.100.35', NOW()),
('grow', '시스템 성능 향상', '백엔드 시스템이 최적화되었습니다.', 3, 0, 190, 'admin', '172.16.254.25', NOW()),
('grow', '문의 처리 속도 향상', '고객 문의 처리 속도가 개선되었습니다.', 2, 0, 175, 'admin', '203.0.113.75', NOW());

# story
INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES
('story', '농장의 하루', '오늘은 농장에서 새로운 작물을 심었습니다.', 3, 0, 150, 'admin', '192.168.0.10', NOW()),
('story', '수확의 기쁨', '드디어 기다리던 수확 시즌이 시작되었습니다.', 4, 0, 180, 'admin', '203.0.113.10', NOW()),
('story', '비 오는 날의 농장', '비가 내려 촉촉해진 밭을 돌아보았습니다.', 2, 0, 130, 'admin', '198.51.100.10', NOW()),
('story', '새로운 작물 도전', '올해는 특별한 작물 재배에 도전합니다.', 5, 0, 170, 'admin', '172.16.254.10', NOW()),
('story', '자연과 함께한 아침', '상쾌한 아침 공기와 함께 농장 일을 시작합니다.', 1, 0, 140, 'admin', '203.0.113.20', NOW()),
('story', '가족과 함께하는 농장 일상', '가족과 함께 농장에서 보낸 하루.', 3, 0, 160, 'admin', '192.168.0.11', NOW()),
('story', '봄맞이 준비', '농장도 봄을 맞이하기 위한 준비에 한창입니다.', 2, 0, 155, 'admin', '203.0.113.30', NOW()),
('story', '작은 새 친구들', '농장에 찾아온 작은 새 친구들 이야기.', 4, 0, 175, 'admin', '198.51.100.20', NOW()),
('story', '농부의 일기', '오늘 하루 농장에서 있었던 일들을 기록합니다.', 3, 0, 145, 'admin', '172.16.254.20', NOW()),
('story', '토마토의 성장 이야기', '토마토가 하루가 다르게 자라나고 있습니다.', 2, 0, 135, 'admin', '203.0.113.40', NOW()),
('story', '밭 갈기 체험', '주말에 밭 갈기 체험 행사를 열었습니다.', 5, 0, 190, 'admin', '192.168.0.12', NOW()),
('story', '농장의 저녁 노을', '노을 진 농장 풍경을 감상하며 하루를 마무리합니다.', 1, 0, 120, 'admin', '203.0.113.50', NOW()),
('story', '새로운 퇴비 사용기', '이번에 새로운 퇴비를 사용해보았습니다.', 2, 0, 125, 'admin', '198.51.100.30', NOW()),
('story', '초록이 무성한 농장', '농장의 초록빛 풍경을 기록합니다.', 3, 0, 170, 'admin', '172.16.254.30', NOW()),
('story', '여름 작물 이야기', '여름 작물들이 햇볕을 받고 무럭무럭 자랍니다.', 4, 0, 185, 'admin', '203.0.113.60', NOW()),
('story', '농장 동물들', '농장에 살고 있는 동물 친구들의 일상.', 5, 0, 200, 'admin', '192.168.0.13', NOW()),
('story', '가을 수확 축제', '가을을 맞아 농장에서 수확 축제를 열었습니다.', 3, 0, 180, 'admin', '203.0.113.70', NOW()),
('story', '겨울 준비', '겨울 작물을 위한 준비가 시작되었습니다.', 2, 0, 165, 'admin', '198.51.100.40', NOW()),
('story', '농부의 하루 일과', '하루 일과를 정리하며 농장의 일상을 공유합니다.', 1, 0, 140, 'admin', '172.16.254.40', NOW()),
('story', '함께 가꾸는 농장', '농장 이웃들과 함께 한 공동 작업 이야기.', 4, 0, 175, 'admin', '203.0.113.80', NOW());

# grow 
INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES
('grow', '새싹이 돋아났어요', '작은 씨앗에서 새싹이 돋아났습니다.', 3, 0, 150, 'admin', '192.168.0.10', NOW()),
('grow', '토마토 첫 잎이 나왔어요', '토마토 작물이 첫 잎을 틔웠습니다.', 4, 0, 180, 'admin', '203.0.113.10', NOW()),
('grow', '상추 심기 완료', '상추 씨앗을 밭에 심고 물을 주었습니다.', 2, 0, 130, 'admin', '198.51.100.10', NOW()),
('grow', '옥수수 싹이 올라왔어요', '옥수수도 드디어 고개를 내밀었네요.', 5, 0, 170, 'admin', '172.16.254.10', NOW()),
('grow', '햇빛 아래 자라는 작물들', '작물들이 따사로운 햇빛 아래 쑥쑥 자라고 있습니다.', 1, 0, 140, 'admin', '203.0.113.20', NOW()),
('grow', '무럭무럭 자라는 고추', '고추가 빠르게 성장하고 있어요.', 3, 0, 160, 'admin', '192.168.0.11', NOW()),
('grow', '새로운 퇴비 사용 효과', '퇴비를 준 이후 작물 성장이 빨라졌어요.', 2, 0, 155, 'admin', '203.0.113.30', NOW()),
('grow', '작물 키 재기', '오늘 작물의 키를 재보니 많이 자랐습니다.', 4, 0, 175, 'admin', '198.51.100.20', NOW()),
('grow', '비 온 후의 변화', '비가 내린 후 작물들이 더 푸르게 변했어요.', 3, 0, 145, 'admin', '172.16.254.20', NOW()),
('grow', '하루가 다르게 크는 상추', '상추 잎이 하루가 다르게 커지고 있습니다.', 2, 0, 135, 'admin', '203.0.113.40', NOW()),
('grow', '가지의 꽃이 피었어요', '가지에 드디어 예쁜 꽃이 피었습니다.', 5, 0, 190, 'admin', '192.168.0.12', NOW()),
('grow', '고구마 넝쿨 뻗기 시작', '고구마 넝쿨이 밭을 가득 메우기 시작했어요.', 1, 0, 120, 'admin', '203.0.113.50', NOW()),
('grow', '가지 열매 맺기 시작', '가지가 열매를 맺기 시작했습니다.', 2, 0, 125, 'admin', '198.51.100.30', NOW()),
('grow', '옥수수 키 크기 기록', '옥수수가 벌써 허리까지 자랐습니다.', 3, 0, 170, 'admin', '172.16.254.30', NOW()),
('grow', '파릇파릇 자라는 쑥갓', '쑥갓들이 점점 더 진한 초록빛을 띱니다.', 4, 0, 185, 'admin', '203.0.113.60', NOW()),
('grow', '감자 싹이 트기 시작', '감자에서 싹이 올라오기 시작했어요.', 5, 0, 200, 'admin', '192.168.0.13', NOW()),
('grow', '농장 한 켠의 허브 정원', '허브들이 작지만 단단하게 자라고 있습니다.', 3, 0, 180, 'admin', '203.0.113.70', NOW()),
('grow', '토마토 꽃 피기 시작', '토마토 줄기에 노란 꽃이 피었습니다.', 2, 0, 165, 'admin', '198.51.100.40', NOW()),
('grow', '딸기 새 잎 돋아남', '딸기 모종에서 새로운 잎이 나왔어요.', 1, 0, 140, 'admin', '172.16.254.40', NOW()),
('grow', '봄 햇살 속의 작물', '봄 햇살 아래 작물들이 건강하게 자랍니다.', 4, 0, 175, 'admin', '203.0.113.80', NOW());

# school
INSERT INTO `Article` (`cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `regip`, `wdate`)
VALUES
('school', '새 학기 시작', '새로운 학기가 시작되었습니다! 모두 힘내세요.', 3, 0, 150, 'admin', '192.168.0.10', NOW()),
('school', '학교 축제 공지', '이번 주 금요일에 학교 축제가 열립니다.', 4, 0, 180, 'admin', '203.0.113.10', NOW()),
('school', '도서관 이용 안내', '도서관 이용 시간이 변경되었습니다.', 2, 0, 130, 'admin', '198.51.100.10', NOW()),
('school', '중간고사 대비 공부법', '효율적인 중간고사 공부법을 공유합니다.', 5, 0, 170, 'admin', '172.16.254.10', NOW()),
('school', '급식 메뉴 업데이트', '이번 주 급식 메뉴가 업데이트되었습니다.', 1, 0, 140, 'admin', '203.0.113.20', NOW()),
('school', '교내 동아리 모집', '신입 동아리원을 모집 중입니다! 많은 참여 바랍니다.', 3, 0, 160, 'admin', '192.168.0.11', NOW()),
('school', '수학 경시대회 일정', '수학 경시대회 일정이 공지되었습니다.', 2, 0, 155, 'admin', '203.0.113.30', NOW()),
('school', '과학 실험 보고서 제출 안내', '과학 실험 보고서 제출 기한을 확인하세요.', 4, 0, 175, 'admin', '198.51.100.20', NOW()),
('school', '체육대회 일정 발표', '다음 달 체육대회 일정이 발표되었습니다.', 3, 0, 145, 'admin', '172.16.254.20', NOW()),
('school', '동아리 활동 보고서 제출', '동아리 활동 보고서 제출 기간이 다가오고 있습니다.', 2, 0, 135, 'admin', '203.0.113.40', NOW()),
('school', '교내 봉사활동 안내', '이번 주말 봉사활동 신청을 받습니다.', 5, 0, 190, 'admin', '192.168.0.12', NOW()),
('school', '학교 도서 기부 캠페인', '도서 기부 캠페인이 시작되었습니다. 많은 참여 바랍니다.', 1, 0, 120, 'admin', '203.0.113.50', NOW()),
('school', '방과 후 프로그램 신청', '방과 후 프로그램 신청이 시작되었습니다.', 2, 0, 125, 'admin', '198.51.100.30', NOW()),
('school', '기말고사 대비 특강 안내', '기말고사 대비를 위한 특별 강의가 진행됩니다.', 3, 0, 170, 'admin', '172.16.254.30', NOW()),
('school', '교내 합창 대회 개최', '합창 대회 참가 신청을 받습니다.', 4, 0, 185, 'admin', '203.0.113.60', NOW()),
('school', '학생회 회장 선거 안내', '학생회 선거 일정과 후보 명단을 확인하세요.', 5, 0, 200, 'admin', '192.168.0.13', NOW()),
('school', '교내 글쓰기 대회', '창의적인 글쓰기를 위한 대회가 열립니다.', 3, 0, 180, 'admin', '203.0.113.70', NOW()),
('school', '모의고사 성적 발표', '모의고사 성적이 발표되었습니다. 확인하세요.', 2, 0, 165, 'admin', '198.51.100.40', NOW()),
('school', '교내 상담 프로그램', '학생들을 위한 상담 프로그램이 운영됩니다.', 1, 0, 140, 'admin', '172.16.254.40', NOW()),
('school', '겨울방학 특강 안내', '겨울방학 동안 특별 강의가 열릴 예정입니다.', 4, 0, 175, 'admin', '203.0.113.80', NOW());

#notice
















# 상품 장보기 임시 데이터

#카테고리
INSERT INTO `category` VALUES (1, '과일');
INSERT INTO `category` VALUES (2, '곡류');
INSERT INTO `category` VALUES (3, '야채');


INSERT INTO `product` (`cateNo`,`prodName`,`prodPrice`,`prodStock`,`prodDiscount`,`prodDeliveryFee`, `prodContent`,`prodPoint`)
VALUES 
-- 과일 (30개)
(1, "복숭아", 5000, 200, 10, 1000, "유기농 복숭아", 500),
(1, "사과", 4000, 150, 5, 800, "달콤한 사과", 400),
(1, "배", 6000, 180, 8, 900, "아삭한 배", 600),
(1, "방울토마토", 3500, 250, 7, 700, "새콤달콤 방울토마토", 350),
(1, "딸기", 7000, 220, 12, 1200, "신선한 딸기", 700),
(1, "오렌지", 5000, 170, 6, 1000, "비타민 가득 오렌지", 500),
(1, "바나나", 3000, 200, 5, 800, "달콤한 바나나", 300),
(1, "포도", 8000, 190, 10, 1000, "새콤한 포도", 800),
(1, "자두", 5500, 160, 7, 900, "신선한 자두", 550),
(1, "체리", 10000, 140, 15, 1500, "달콤한 체리", 1000),
(1, "레몬", 4000, 180, 5, 700, "상큼한 레몬", 400),
(1, "자몽", 6000, 175, 8, 1000, "비타민 가득 자몽", 600),
(1, "멜론", 12000, 130, 10, 1500, "달콤한 멜론", 1200),
(1, "수박", 15000, 110, 12, 2000, "시원한 수박", 1500),
(1, "파인애플", 9000, 125, 9, 1200, "새콤달콤 파인애플", 900),
(1, "망고", 11000, 135, 11, 1300, "부드러운 망고", 1100),
(1, "키위", 4500, 160, 5, 800, "비타민C 가득 키위", 450),
(1, "블루베리", 8500, 155, 10, 1000, "항산화 블루베리", 850),
(1, "라임", 3500, 170, 4, 700, "상큼한 라임", 350),
(1, "무화과", 7000, 145, 8, 1100, "달콤한 무화과", 700),
(1, "석류", 7500, 150, 9, 1200, "영양 가득 석류", 750),
(1, "코코넛", 13000, 100, 15, 1800, "신선한 코코넛", 1300),
(1, "홍시", 5000, 130, 7, 1000, "달콤한 홍시", 500),
(1, "유자", 5500, 140, 6, 900, "향긋한 유자", 550),
(1, "패션후르츠", 8500, 120, 10, 1100, "열대과일 패션후르츠", 850),
(1, "참외", 6000, 125, 8, 1000, "아삭한 참외", 600),
(1, "구아바", 9000, 115, 12, 1300, "이국적인 구아바", 900),
(1, "파파야", 11000, 105, 11, 1400, "부드러운 파파야", 1100),
(1, "스타프루트", 7500, 110, 9, 1200, "독특한 스타프루트", 750);

INSERT INTO `image` (`prodNo`, `sName`)
VALUES 
(1, "peach.png"),
(2, "apple.png"),
(3, "pear.png"),
(4, "cherry_tomato.png"),
(5, "strawberry.png"),
(6, "orange.png"),
(7, "banana.png"),
(8, "grape.png"),
(9, "plum.png"),
(10, "cherry.png"),
(11, "lemon.png"),
(12, "grapefruit.png"),
(13, "melon.png"),
(14, "watermelon.png"),
(15, "pineapple.png"),
(16, "mango.png"),
(17, "kiwi.png"),
(18, "blueberry.png"),
(19, "lime.png"),
(20, "fig.png"),
(21, "pomegranate.png"),
(22, "coconut.png"),
(23, "persimmon.png"),
(24, "yuzu.png"),
(25, "passionfruit.png"),
(26, "oriental_melon.png"),
(27, "guava.png"),
(28, "papaya.png"),
(29, "starfruit.png"),
(30, "dragonfruit.png");



