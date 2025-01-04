import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 제목 텍스트
                Icon(
                  Icons.fastfood, // 음식 관련 아이콘
                  size: 48,
                  color: Colors.black,
                ),
                SizedBox(height: 8),
                Text(
                  "오늘은 어떤 요리를 먹을까?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),

                // 서브 텍스트
                Text(
                  "새로운 요리를 도전해볼까?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // 음식 추천받기 버튼
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat'); // 음식 추천 페이지로 이동
                  },
                  child: Text(
                    "음식 추천받기",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // 이전 추천 음식 버튼
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/history'); // 이전 음식 확인 페이지로 이동
                  },
                  child: Text(
                    "이전 추천 음식",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
