require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create!(email: 'test@test.com', password: 'asdfghij', password_confirmation: 'asdfghij',
                        first_name: 'Harry', last_name: 'Potter')
    login_as(user, :scope => :user)
    visit new_post_path
  end

  describe 'index' do
    it 'can be reached succesfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create!(date: Date.today, rationale: 'Something cool here for post 1')
      post2 = Post.create!(date: Date.today, rationale: 'Something cool here for post 2')
      visit posts_path
      expect(page).to have_content(/Something cool here for post 1 | Something cool here for post 2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated with a post' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end
end

# TODO refactor user association integration


