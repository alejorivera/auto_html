require File.expand_path('../../unit_test_helper', __FILE__)

class HtmlEscapeTest < Minitest::Test

  def test_trasform
    result = auto_html("<script>alert(0)</script>") { html_escape }
    assert_equal "&lt;script&gt;alert(0)&lt;/script&gt;", result
  end

  def test_trasform2
    result = auto_html("<div>test</div>") { html_escape }
    assert_equal "&lt;div&gt;test&lt;/div&gt;", result
  end

end
