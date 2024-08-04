import 'package:learn_ease/model/lessonInfo.dart';

class courseInfo {
  String? courseId;
  String? courseName;
  String? courseInstructor;
  String? courseDescription;
  String? totalLengthHours;
  String? courseLanguage;
  String? catigory;
  String? numOfLessons;
  String? courseCertificated;
  String? coursePrice;
  double? courseRating;
  String? numOfReviews;
  String? couponValue;
  String? couponValidate;
  

  courseInfo({
    this.courseId,
    required this.courseName,
    required this.courseInstructor,
    required this.courseDescription,
    required this.totalLengthHours,
    required this.courseLanguage,
    required this.catigory,
    required this.numOfLessons,
    required this.courseCertificated,
    required this.coursePrice,
    this.courseRating,
    this.numOfReviews,
    this.couponValue,
    this.couponValidate,
    
  });

  factory courseInfo.fromJson(Map<String, dynamic> json) {
    return courseInfo(
        courseId: json['_id'],
        courseName: json['course name'],
        courseInstructor: json['course instructor'],
        courseDescription: json['course description'],
        totalLengthHours: json['total length hours'],
        courseLanguage: json['course language'],
        catigory: json['catigory'],
        numOfLessons: json['num of lessons'],
        courseCertificated: json['course certificated'],
        coursePrice: json['course price'],
        courseRating: json['course rating'],
        numOfReviews: json['num of reviews'],
        couponValue: json['coupon value'],
        couponValidate: json['coupon validate'],
        
        );
        
  }
}
