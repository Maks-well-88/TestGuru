module TestsHelper
  def test_header(test)
    test.persisted? ? t('edit_test', title: @test.title) : t('new_test')
  end
end
