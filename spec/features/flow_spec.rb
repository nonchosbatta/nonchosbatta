require 'rails_helper'

describe 'the whole flow from the side of the data model since user registration to episode publishing', type: :feature do
  let(:kimi_aoi) { FactoryGirl.create(:user) }
  let!(:kimi_alias) { kimi_aoi.aliases.create(name: 'Kimi') }
  scenario 'Kimi Aoi assigns an alias to herself' do
    expect(kimi_aoi.aliases.pluck(:name)).to match_array(['Kimi'])
  end

  let(:omnivium) { FactoryGirl.create(:fansub, owner: kimi_aoi) }
  scenario 'Kimi Aoi creates the fansub Omnivium' do
    expect(omnivium.owner).to eq kimi_aoi
    expect(kimi_aoi.fansubs).to include(omnivium)
  end

  let(:roxas) { FactoryGirl.create(:user, username: 'Roxas Shadow') }
  scenario 'Kimi Aoi adds Roxas Shadow to Omnivium as translator' do
    omnivium.fansub_staffers.create(staffer: roxas, role: FansubStaffer.roles[:translator])

    expect(omnivium.fansub_staffers.last.staffer).to eq roxas
    expect(omnivium.fansub_staffers.last.role).to eq 'translator'
  end

  let(:owari_subs) { FactoryGirl.create(:fansub, owner: kimi_aoi, name: 'Owari Subs') }
  let(:omni_owari) { FactoryGirl.create(:collaboration, name: 'OmniOwari') }
  scenario 'Kimi Aoi creates a collaboration through Omnivium and Owari Subs' do
    omni_owari.fansub_collaborations.create(fansub: omnivium)
    omni_owari.fansub_collaborations.create(fansub: owari_subs)
  end

  let!(:omnivium_owari) { omni_owari.aliases.create(name: 'Omnivium + Owari Subs') }
  scenario 'Kimi Aoi assigns an alias to OmniOwari' do
    expect(omni_owari.aliases.pluck(:name)).to include('Omnivium + Owari Subs')
  end

  let(:jae) { FactoryGirl.create(:show, collaboration: omni_owari, fansub_alias: omnivium_owari ) }
  scenario 'Kimi Aoi adds the show JAE to OmniOwari' do
    expect(jae.collaboration).to eq omni_owari
    expect(jae.fansub_alias.name).to eq 'Omnivium + Owari Subs'
    expect(jae.short_title).to eq 'JAE'
  end

  let!(:episode) { FactoryGirl.create(:episode, show: jae) }
  scenario 'Kimi Aoi adds an episode to JAE' do
    expect(jae.episodes.last.translation).to eq 'ongoing'
    expect(jae.episodes.last.editing).to eq 'nope'
  end

  let(:encoder) { FansubStaffer.roles[:encoder] }
  let(:episode_staffer) { FactoryGirl.create(:episode_staffer, staffer: kimi_aoi, episode: episode, role: encoder, alias: kimi_alias) }
  scenario 'Kimi Aoi adds herself as encoder of the episode 1 of JAE' do
    expect(episode_staffer.staffer).to eq kimi_aoi
    expect(episode_staffer.role).to eq 'encoder'
    expect(episode_staffer.alias.name).to eq 'Kimi'
    expect(episode_staffer.episode.show).to eq jae
  end
end
