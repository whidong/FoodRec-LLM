## LLM을 활용한 사용자 맞춤 음식 추천 시스템 :이미지 기반 음식명 추출 및 대화형 추천을 중심으로
### Development of a Personalized Food Recommendation System Using LLM :Focusing on Image-Based Food Name Extraction and Conversational Recommendations
---
📦**Deploy:** [PersonalRecipeRecommender-A4](https://whidong.github.io/PersonalRecipeRecommender/)

---

프로젝트 기간 (2024.10 ~ 2024.12)


## 프로젝트 개요
이 프로젝트는 LLM(대규모 언어 모델)과 멀티모달 이미지 분석 기술을 활용하여 사용자의 선호에 맞춘 음식 추천 시스템을 구현하는 것을 목표로 합니다. 음식 이미지에서 텍스트를 추출하고 대화형 추천을 통해 개인화된 요리를 추천합니다.

## 주요 기능
1. 음식 이미지 기반 텍스트 분석 및 음식명 추출
2. 대화형 인터페이스를 통한 사용자 맞춤형 추천
3. 사용자 히스토리 기록 및 추천 결과 저장

## 시스템 구성
- **Frontend**: Flutter
- **Backend**: Firebase
- **모델 사용**:
  - GPT 4v (Image-to-Text)
  - GPT 3.5 turbo (Text-to-Text)

## 데이터 전처리
1. 자료 수집
- 사용자가 직접 최근에 먹은 음식 사진(5장)을 업로드합니다.
- 업로드된 이미지는 LLM API를 활용하여 텍스트 형태의 음식명으로 변환합니다.
- 사용자의 음식 섭취 히스토리, 선택한 추천 음식 및 레시피 정보는 Firebase에 저장되어 추후 추천에 반영됩니다.

2. 이미지 데이터 전처리
- 이미지는 512x512로 리사이즈 후, Base64 형식으로 변환되어 GPT-4o 모델로 전달됩니다.
- 웹 환경에서는 XFile 객체로 이미지를 처리하며, Base64 인코딩 후 GPT-4에 전달하여 음식명을 추출합니다.
- 추출된 음식 정보는 사용자의 최근 취향을 반영하는 데이터로 활용되어, 맞춤형 추천에 사용됩니다.

## LLM 기반 음식 추천 프로세스
1. 음식 취향 정보 수집
- 사용자는 음식 선호도, 알러지, 매운 정도, 온도, 조리 시간, 식사 종류(아침/점심 등) 등의 정보를 입력합니다.

2. 음식명 추출
- 업로드된 이미지에서 BLP 및 LLM API를 활용해 음식명을 추출합니다.

3. 추천 생성
- GPT-3.5-turbo 모델에 최근 먹은 음식 리스트와 취향 정보를 프롬프트로 제공, 5개의 맞춤형 추천 요리를 생성합니다.

4. 대화형 추천 및 레시피 제공
- 추천된 음식 중 하나를 선택하면, 챗봇과 자연스럽게 대화하며 해당 요리의 레시피 정보를 안내받을 수 있습니다.

5. 데이터 저장 및 재활용
- 추천 과정 및 결과(선택 음식, 레시피)는 Firebase에 저장되며, 다음 추천에 활용됩니다.

## 실행 방법
1. `flutter pub get` 명령어로 의존성 설치
2. `flutter run`으로 앱 실행
3. Firebase 프로젝트 설정 필요

## 결과 예시

1. **사용자 현재 선호도 및 최근 맛있게 먹은 음식 사진**  
![사용자 현재 선호도 및 최근 맛있게 먹은 음식 사진](https://github.com/user-attachments/assets/d7a0c9d2-6e31-493c-b880-1dcf643c593b)  
*사용자 선호 음식 및 취향을 선택하고 최근 맛있게 먹은 음식 사진을 업로드하는 화면*

---

2. **추천받은 요리 목록**  
![추천받은 요리 목록](https://github.com/user-attachments/assets/a7289f45-a509-42b0-90fa-b855814090e8)  
*사용자의 선호도와 최근 맛있게 먹은 음식을 고려하여 5가지 음식을 추천해주는 화면*

---

3. **사용자가 선택한 요리의 재료 및 레시피**  
![사용자가 선택한 요리의 재료 및 레시피](https://github.com/user-attachments/assets/ba82cce1-e337-4d02-b5e2-1a73e69110e3)  
*선택한 요리에 대한 정보, 재료, 조리 방법을 보여주는 화면*

---

4. **사용자 추천 정보 Database 저장**  
![사용자 추천 정보 Database 저장](https://github.com/user-attachments/assets/ec4fa3aa-678f-47b2-b65d-727d9fd5cace)  
*사용자가 추천 받을때 사용한 최근 맛있게 먹은 음식 정보와 추천받은 요리 목록 그리고 선택한 요리에 대한 정보 및 조리방법을 database에 저장합니다.*

---

