import 'package:flutter/material.dart';

class TopicsData {
  TopicsData._();

  static const List<String> topics = [
    'Depression',
    'Stress and Anxiety',
    'Coping with Addictions',
    'Anxiety',
    'Family Issues',
    'Trauma & Abuse',
    'Relationship Issues',
    'Sexuality Issues',
    'Coping with Grief and Loss',
    'Eating Disorder',
    'Sleeping Disorder',
    'Motivation, Self esteem and confidence',
    'Fatigue',
    'Anger Management',
    'Career Choices',
    'Bipolar Disorder',
    'Concentration, memory and focus (ADHD)',
    'Executive and Professional Coaching',
    'Life Changes',
    'Parenting Issues',
  ];

  static const Map<String, Color> topicColors = {
    'Depression': Color(0xFF003D5C),
    'Stress and Anxiety': Color(0xFFD32F2F),
    'Coping with Addictions': Color(0xFFFDB827),
    'Anxiety': Color(0xFF008B8B),
    'Trauma & Abuse': Color(0xFFFDB827),
    'Relationship Issues': Color(0xFFFDB827),
    'Sexuality Issues': Color(0xFF008B8B),
    'Coping with Grief and Loss': Color(0xFFD32F2F),
    'Eating Disorder': Color(0xFFFDB827),
    'Sleeping Disorder': Color(0xFFD32F2F),
    'Motivation, Self esteem and confidence': Color(0xFFFDB827),
    'Fatigue': Color(0xFF003D5C),
    'Anger Management': Color(0xFFFDB827),
    'Career Choices': Color(0xFF003D5C),
    'Bipolar Disorder': Color(0xFFFDB827),
    'Concentration, memory and focus (ADHD)': Color(0xFFD32F2F),
    'Executive and Professional Coaching': Color(0xFFFDB827),
    'Life Changes': Color(0xFF008B8B),
    'Parenting Issues': Color(0xFF008B8B),
  };
}