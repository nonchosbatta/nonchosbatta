User.create!([
  {username: "Roxas Shadow", email: "roxas.shadow@hotmail.it", password: "secret99", password_confirmation: "secret99", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2015-08-09 12:58:00", sign_in_count: 1, current_sign_in_at: "2015-08-09 12:58:00", last_sign_in_at: "2015-08-09 12:58:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "442484c5ac8c10271b46922c590aa670a24986a964721142d51d0238e5d5c41c", confirmed_at: "2015-08-09 12:58:00", confirmation_sent_at: "2015-08-09 12:58:00", unconfirmed_email: ""}
])
Alias.create!([
  {subject_id: 1, subject_type: "User", name: "Rox"},
  {subject_id: 1, subject_type: "User", name: "Roxas"},
  {subject_id: 1, subject_type: "Fansub", name: "Sakugavium"},
  {subject_id: 1, subject_type: "Collaboration", name: "OmniOwariDesuka"}
])
Collaboration.create!([
  {name: "OmniOwari"}
])
Episode.create!([
  {show_id: 1, number: 1, url: "", translation: nil, editing: nil, checking: nil, timing: nil, typesetting: nil, encoding: nil, qchecking: nil}
])
EpisodeStaffer.create!([
  {staffer_id: 1, alias_id: nil, episode_id: 1, role: 0},
  {staffer_id: 1, alias_id: 4, episode_id: 1, role: 0}
])
Fansub.create!([
  {owner_id: 1, name: "Omnivium", url: "http://omnivium.it"},
  {owner_id: 1, name: "Owari Subs", url: ""}
])
FansubCollaboration.create!([
  {fansub_id: 2, collaboration_id: 1},
  {fansub_id: 1, collaboration_id: 1}
])
FansubStaffer.create!([
  {staffer_id: 1, fansub_id: 1, role: 2}
])
Show.create!([
  {fansub_id: nil, collaboration_id: 1, title: "Japan Anime Expo", short_title: "JAE", episodes_count: nil, status: 0, format: 3, started_at: "2015-08-01", ended_at: nil}
])
