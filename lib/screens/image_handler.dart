import 'dart:io';
import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // kIsWeb 사용
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../services/api_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class ImageHandler {
  final ImagePicker _imagePicker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> _selectedImages = [];
  List<String> _imageDescriptions = [];

  List<String> get selectedImages => _selectedImages;
  List<String> get imageDescriptions => _imageDescriptions;

  /// 이미지를 선택
  Future<bool> pickImages() async {
    try {
      final List<XFile>? images = await _imagePicker.pickMultiImage();
      if (images != null && images.length == 5) {
        _selectedImages = images.map((image) => image.path).toList();
        return true;
      } else {
        return false; // 5장 미만 선택 시 false 반환
      }
    } catch (e) {
      debugPrint("이미지 선택 중 오류 발생: $e");
      return false;
    }
  }

  /// 이미지 크기 조정 및 Base64 변환
  Future<List<String>> resizeAndConvertToBase64() async {
    List<Future<String>> futures = [];

    for (final imagePath in _selectedImages) {
      futures.add(_processImage(imagePath));
    }

    return await Future.wait(futures);
  }

  Future<String> _processImage(String imagePath) async {
    try {
      if (kIsWeb) {
        // 웹 환경에서 이미지 처리
        final XFile webImage = XFile(imagePath);
        final Uint8List imageData = await webImage.readAsBytes();

        // 이미지 데이터를 Blob으로 변환
        final html.Blob blob = html.Blob([imageData]);
        final String url = html.Url.createObjectUrl(blob);
        final html.ImageElement imgElement = html.ImageElement(src: url);

        // 이미지 로드 대기
        await imgElement.onLoad.first;

        // Canvas 생성 및 이미지 그리기
        final int targetWidth = 512;
        final int targetHeight = 512;
        final html.CanvasElement canvas =
            html.CanvasElement(width: targetWidth, height: targetHeight);
        final html.CanvasRenderingContext2D ctx = canvas.context2D;

        // 이미지 크기 조정 및 그리기
        ctx.drawImageScaled(imgElement, 0, 0, targetWidth, targetHeight);

        // Canvas로부터 데이터 URL 얻기
        final String dataUrl = canvas.toDataUrl('image/jpeg', 0.7); // 품질 조정

        // Base64 데이터 추출
        final String base64Image =
            dataUrl.replaceFirst(RegExp(r'data:image\/jpeg;base64,'), '');

        // 리소스 해제
        html.Url.revokeObjectUrl(url);

        return base64Image;
      } else {
        // 모바일/데스크톱 환경에서 이미지 처리
        final imageFile = File(imagePath);
        final imageData = await imageFile.readAsBytes();

        // 이미지 디코딩
        final originalImage = img.decodeImage(imageData);
        if (originalImage == null) throw Exception("이미지 디코딩 실패");

        // 이미지 크기 조정
        final resizedImage =
            img.copyResize(originalImage, width: 512, height: 512);

        // Base64 변환
        final base64Image =
            base64Encode(img.encodeJpg(resizedImage, quality: 70));
        return base64Image;
      }
    } catch (e) {
      debugPrint("이미지 크기 조정 및 변환 오류: $e");
      return ""; // 오류 발생 시 빈 문자열 반환
    }
  }

  /// 선택한 이미지 및 결과 초기화
  void clearImages() {
    _selectedImages.clear();
  }

  /// 이미지 미리보기
  Widget buildImagePreview(String path) {
    return kIsWeb
        ? Image.network(
            path,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          )
        : Image.file(
            File(path),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          );
  }
}
