User.destroy_all
Answer.delete_all
Question.destroy_all
Test.destroy_all
Category.destroy_all

  categories = []
  3.times do
    categories << Category.create(title: Faker::Lorem.sentence(word_count: 3, supplemental: true))
  end

  tests = []
  categories.each do |category|
    10.times do
      tests << Test.create(
            title: Faker::Lorem.sentence(word_count: 3),
            level: rand(1..3),
            category_id: category.id)
    end
  end

  questions = []
  tests.each do |test|
    2.times do
      questions << Question.create(
            body: Faker::Lorem.question(word_count: 4),
            test_id: test.id)
    end
    User.create(name: Faker::Name.name, email: Faker::Internet.email).tests << test
  end

  questions.each do |question|
    2.times do
      Answer.create(
        body: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        question_id: question.id)
    end
  end

p "Создано #{User.count} пользователей."
p "Создано #{Answer.count} ответов."
p "Создано #{Category.count} категории."
p "Создано #{Question.count} вопросов."
p "Создано #{Test.count} тестов."
