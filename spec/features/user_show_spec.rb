require 'rails_helper'

RSpec.describe 'Index', type: :feature do
  before :each do
    @user_gra = User.create(name: 'GracianoHenrique', photo: 'https://graciano.jpg', bio: 'Web Developer',
                            posts_counter: 0)
    @user_sha = User.create(name: 'Sha', photo: 'https://sha.jpg', bio: 'Web Developer', posts_counter: 0)