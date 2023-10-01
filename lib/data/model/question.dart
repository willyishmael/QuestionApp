import 'package:flutter/material.dart';

class Question {
  final QuestionCategory category;
  final String question;
  final List<String> hints;
  final String answer;

  const Question(
      {required this.category,
      required this.question,
      required this.hints,
      required this.answer});

  static get questionList => [
        const Question(
            category: QuestionCategory.general,
            question:
                "What is the true essence of existence? Is it to experience joy and learn from suffering?",
            hints: [
              "Hint 1: Many philosophers have pondered this question throughout history.",
              "Hint 2: Some believe that the meaning of life is a deeply personal and subjective matter."
            ],
            answer:
                "The answer to this question may vary from person to person."),
        const Question(
            category: QuestionCategory.music,
            question:
                "If Bruno Mars were to have a signature dish, would it be a gourmet burger adorned with exotic toppings, or a platter of zesty tacos bursting with flavor?",
            hints: [
              "Hint 1: Think about Bruno Mars' style and persona as a musician.",
              "Hint 2: Consider the type of food that might reflect his musical vibe."
            ],
            answer:
                "This is a fun hypothetical question and doesn't have a definitive answer."),
        const Question(
            category: QuestionCategory.sports,
            question:
                "When comparing the skills and influence of Ronaldo and Messi on the field, is it possible to declare one superior, or do they each bring a unique magic to the game that defies comparison?",
            hints: [
              "Hint 1: Ronaldo and Messi are two of the greatest footballers of all time.",
              "Hint 2: Consider their different playing styles and achievements."
            ],
            answer:
                "Both Ronaldo and Messi are exceptional players with unique qualities."),
        const Question(
            category: QuestionCategory.general,
            question:
                "In the grand tapestry of human experience, how do we decipher the intricate threads that weave together to create our perception of happiness?",
            hints: [
              "Hint 1: Happiness is a complex and subjective emotion.",
              "Hint 2: It can be influenced by various factors such as relationships, purpose, and perspective."
            ],
            answer:
                "Deciphering the nature of happiness is a lifelong journey for many."),
        const Question(
            category: QuestionCategory.music,
            question:
                "Among the discography of the legendary Michael Jackson, which album stands out as a timeless masterpiece that continues to captivate listeners across generations?",
            hints: [
              "Hint 1: Michael Jackson released many iconic albums.",
              "Hint 2: Consider albums like 'Thriller' and their impact on music history."
            ],
            answer:
                "Many consider 'Thriller' to be Michael Jackson's timeless masterpiece."),
        const Question(
            category: QuestionCategory.sports,
            question:
                "Throughout the annals of basketball history, who stands atop the pinnacle with the record for the highest individual score achieved in a single game?",
            hints: [
              "Hint 1: This record is a significant achievement in basketball history.",
              "Hint 2: It was achieved by a legendary player in a historic game."
            ],
            answer:
                "Wilt Chamberlain holds the record for the highest individual score in a single game with 100 points."),
        const Question(
            category: QuestionCategory.general,
            question:
                "As humanity gazes into the abyss of time, contemplating the realm of possibility, is the concept of time travel merely a figment of imagination or a potential key to unlocking the secrets of the universe?",
            hints: [
              "Hint 1: Time travel is a popular topic in science fiction.",
              "Hint 2: Consider the theories and paradoxes related to time travel."
            ],
            answer:
                "Time travel remains a theoretical concept with many unresolved questions."),
        const Question(
            category: QuestionCategory.music,
            question:
                "Immersed in the poetic verses of the song 'Imagine,' who crafted this profound musical reflection on a world without boundaries, divisions, and strife?",
            hints: [
              "Hint 1: 'Imagine' is a famous song known for its message of peace.",
              "Hint 2: The artist who created it was a legendary musician and peace activist."
            ],
            answer:
                "John Lennon, a member of The Beatles, crafted the song 'Imagine.'"),
        const Question(
            category: QuestionCategory.sports,
            question:
                "Among the myriad global sporting spectacles that enrapture billions, which event stands as the ultimate pinnacle of competitive prowess and international unity?",
            hints: [
              "Hint 1: This event occurs every four years and brings nations together.",
              "Hint 2: It features a wide range of sports and showcases the best athletes in the world."
            ],
            answer:
                "The Olympic Games stand as the ultimate pinnacle of sports and international unity."),
        const Question(
            category: QuestionCategory.general,
            question:
                "As humanity's creative expression takes form on canvas, in sculpture, and through various mediums, what intrinsic yearning does art seek to fulfill in the human soul?",
            hints: [
              "Hint 1: Art has been a part of human culture for millennia.",
              "Hint 2: It often serves multiple purposes, including emotional expression and communication."
            ],
            answer:
                "Art seeks to fulfill a deep yearning for self-expression, communication, and emotional connection."),
      ];
}

enum QuestionCategory {
  general(Icons.newspaper),
  sports(Icons.sports_basketball),
  music(Icons.music_note);

  const QuestionCategory(this.icon);
  final IconData icon;

  Icon getImage(Color color) => Icon(icon, color: color,);
}
