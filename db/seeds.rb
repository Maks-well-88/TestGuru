# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Answer.delete_all
Question.destroy_all
Test.destroy_all
Category.destroy_all

  Category.create([{title: 'Промышленность'}, {title: 'IT-сфера'}, {title: 'Общепит'}])

  100.times do |i|
    Test.create(
      title: Faker::Lorem.sentence(word_count: 3),
      level: rand(1..3),
      category_id: rand(1..3))
  end

  100.times do |i|
    Question.create(
      body: Faker::Lorem.question(word_count: 4),
      test_id: i += 1
      )
  end

  100.times do |i|
    Answer.create(
      body: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
      correct: [true, false].sample,
      question_id: i += 1
      )
  end

  100.times do |i|
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email)
  end

p "Создано #{User.count} пользователей."
p "Создано #{Answer.count} ответов."
p "Создано #{Category.count} категорий."
p "Создано #{Question.count} вопросов."
p "Создано #{Test.count} вопросов."
