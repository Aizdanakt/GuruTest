# frozen_string_literal: true

class BadgeService

  def initialize(user_passed_test)
    @user = user_passed_test.user
    @test = user_passed_test.test
    @user_passed_test = user_passed_test
  end

  def earn_achievements
    badges = Badge.all

    badges.each do |badge|

      method_name = "earn_#{badge.rule.criteria}"
      check_name = "#{badge.rule.criteria}_passed?"

      send(method_name, badge) if send(check_name)
    end
  end

  private

  def all_tests_in_category_passed?
    user_tests_in_category = @user.tests.where(category: @test.category).uniq

    user_tests_in_category.count == Test.where(category: @test.category).count
  end

  def first_attempt_passed?
    @user.user_passed_tests.where(test: @test).count == 1
  end

  def all_tests_of_level_passed?
    Test.where(level: @test.level).count == @user.user_tests_by_level(@test.level).uniq.count
  end

  def earn_all_tests_in_category(badge)
    return unless badge.option_data == @test.category.title

    create_achievement(badge)
  end

  def earn_first_attempt(badge)
    return unless badge.option_data == @test.title

    create_achievement(badge)
  end

  def earn_all_tests_of_level(badge)
    return unless badge.option_data == @test.level

    create_achievement(badge)
  end

  def create_achievement(badge)
    Achievement.create!({
                          user: @user,
                          badge: badge
                        })
  end
end
