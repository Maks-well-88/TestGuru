class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_test = @test_passage.test
    @current_user = @test_passage.user
    @badges = Badge.all
  end

  def call
    @user_badges = @current_user.badges.count
    @badges.each do |badge|
      if send("#{badge.rule}_rule_observed?", badge)
        @current_user.badges.push(badge)
      end
    end
    checking_new_badges
  end

  private

  def checking_new_badges
    information = I18n.t('information')
    @user_badges_after_passing = @current_user.badges.count
    information if @user_badges != @user_badges_after_passing
  end

  def level_rule_observed?(badge)
    success_tests_by_level = passed_success.find_by_level(badge.rule_value).uniq.count
    all_tests_by_level = Test.find_by_level(badge.rule_value).count
    success_tests_by_level == all_tests_by_level && !@current_user.badges.include?(badge)
  end

  def category_rule_observed?(badge)
    success_tests_by_category = passed_success.tests_by_category(badge.rule_value).uniq.count
    all_tests_by_category = Test.tests_by_category(badge.rule_value).count
    success_tests_by_category == all_tests_by_category && !@current_user.badges.include?(badge)
  end

  def first_rule_observed?(badge)
    test_passed_by_user = @current_test.test_passages.where(user_id: @current_user.id)
    test_passed_by_user.count == 1 ? test_passed_by_user.first.success? : false
  end

  def passed_success
    @current_user.tests.where("test_passages.success = true")
  end
end
