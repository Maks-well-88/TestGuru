module TestsHelper
  def test_header(test)
    test.persisted? ? "Edit #{@test.title} Test" : "Create New Test"
  end
end
