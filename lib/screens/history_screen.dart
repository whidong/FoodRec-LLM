import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 임시 데이터
    final List<Map<String, String>> previousRecommendations = [
      {"food": "김치찌개", "date": "2024-11-25"},
      {"food": "된장찌개", "date": "2024-11-24"},
      {"food": "비빔밥", "date": "2024-11-23"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("HISTORY"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 이동
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 제목 영역
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Text(
                  "이전에 추천받은 요리들",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              // 추천 리스트
              Expanded(
                child: ListView.builder(
                  itemCount: previousRecommendations.length,
                  itemBuilder: (context, index) {
                    final recommendation = previousRecommendations[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.restaurant_menu,
                            color: Colors.orange,
                            size: 32,
                          ),
                          title: Text(
                            recommendation["food"]!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "추천받은 날짜: ${recommendation["date"]}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
