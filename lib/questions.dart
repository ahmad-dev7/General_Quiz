class Questions {
  String question;
  bool answer;
  Questions({
    required this.question,
    required this.answer,
  });
}

List<Questions> questionBank = [
  Questions(
    question: 'India is located in Asia.',
    answer: true,
  ),
  Questions(
    question: 'The Great Wall of China is the longest wall in the world.',
    answer: true,
  ),
  Questions(
    question: 'The capital of Australia is Sydney.',
    answer: false,
  ),
  Questions(
    question: 'The Nile river is the longest river in the world.',
    answer: false,
  ),
  Questions(
    question: 'Mount Everest is the highest mountain in the world.',
    answer: true,
  ),
  Questions(
    question: 'The currency of Japan is the yen.',
    answer: true,
  ),
  Questions(
    question: 'The Pacific Ocean is the largest ocean in the world.',
    answer: true,
  ),
  Questions(
    question: 'The Taj Mahal is located in Mumbai, India.',
    answer: false,
  ),
  Questions(
    question:
        'The Statue of Liberty was a gift from France to the United States.',
    answer: true,
  ),
  Questions(
    question: 'The Great Barrier Reef is located off the coast of Brazil.',
    answer: false,
  ),
];
