Answer.delete_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all
=begin
categories = []
3.times do
  categories << Category.create!(title: Faker::Lorem.sentence(word_count: 3, supplemental: true))
end

users = []
6.times do
  users << User.create!(
      name: Faker::Name.first_name,
      surname: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'qwerty12345')
end

tests = []
categories.each_with_index do |category, index|
  2.times do
    tests << Test.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        level: rand(1..3),
        category_id: category.id,
        user_id: users[index].id)
  end
end

10.times do
  users[rand(0..5)].tests << tests[rand(0..5)]
end

questions = []
tests.each do |test|
  questions << Question.create!(
        body: Faker::Lorem.question(word_count: 4),
        test_id: test.id)
end

questions.each do |question|
  2.times do
    Answer.create!(
        body: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        correct: [true, false].sample,
        question_id: question.id)
  end
end
=end
p "Создано пользователей: #{User.count}"
p "Создано ответов: #{Answer.count}"
p "Создано категории: #{Category.count}"
p "Создано вопросов: #{Question.count}"
p "Создано тестов: #{Test.count}"
