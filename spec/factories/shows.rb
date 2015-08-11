FactoryGirl.define do
  factory :show do
    title 'Japan Anime Expo'
    short_title 'JAE'
    episodes_count 50
    status { Show.statuses[:doing] }
    format { Show.formats[:ona] }
    started_at { Date.parse('2015/04/01') }
  end
end
