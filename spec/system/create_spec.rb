
require 'rails_helper'

RSpec.describe 'create article', type: :system do
  before do
    login_as(FactoryBot.create(:user))
  end
  
  it 'empty title and body' do
    visit new_article_path
    click_button 'Submit'

    # The page should show error message 'Title can't be blank'
    expect(page).to have_content("Title can't be blank")

    # No article record is created
    expect(Article.count).to eq(0)
  end
  
  # happy path scenario block
  it 'valid title and body' do
    visit new_article_path
    # fill in text fields with specified string
    fill_in 'Title', with: 'RubyYagi'
    fill_in 'Body', with: 'hello from rails'
    click_button 'Submit'
    
    # The page should show success message
    expect(page).to have_content("Article was successfully created")

    # 1 new article record is created
    expect(Article.count).to eq(1)
    
    # Optionally, you can check the latest record data
    expect(Article.last.title).to eq('RubyYagi')
  end
end