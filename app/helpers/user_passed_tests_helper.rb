module UserPassedTestsHelper

  def views_result(result)
    "<h3>Success percentage:<span class=#{if result[1] >= result[0]
                                            'text-success'
                                          else
                                            'text-danger'
                                          end}> #{result[1]} </span></h3>".html_safe
  end
end
