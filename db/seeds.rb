Answer.delete_all
Question.destroy_all
Test.destroy_all
Category.destroy_all

Category.create!(title: Faker::Lorem.sentence(word_count: 3, supplemental: true))
Test.create!(title: Faker::Lorem.sentence(word_count: 3), level: 1, category_id: Category.first.id, user_id: User.first.id)

questions = []
4.times do
  questions << Question.create!(body: Faker::Lorem.question(word_count: 4), test_id: Test.first.id)
end

questions.each do |question|
  4.times do
    Answer.create!(
        body: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        correct: [true, false].sample,
        question_id: question.id)
  end
end

p "Создано пользователей: #{User.count}"
p "Создано ответов: #{Answer.count}"
p "Создано категории: #{Category.count}"
p "Создано вопросов: #{Question.count}"
p "Создано тестов: #{Test.count}"
