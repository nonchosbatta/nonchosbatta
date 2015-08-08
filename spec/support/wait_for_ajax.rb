module WaitForAjax
  def finished_all_ajax_requests?
    return_value = page.evaluate_script <<-SCRIPT.strip.gsub(/\s+/,' ')
      (function() {
        if(typeof jQuery != 'undefined') {
          return jQuery.active;
        }
        else {
          console.log("Failed on the page: " + document.URL);
          console.error("An error occurred when checking for `jQuery.active`.");
        }
      })()
    SCRIPT
    return_value and return_value.zero?
  end

  def wait_for_ajax(wait_time = nil)
    wait_time ||= Capybara.default_wait_time

    Timeout.timeout(wait_time) do
      loop until finished_all_ajax_requests?
    end
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
end
