require 'rails_helper'

RSpec.describe 'update article', type: :system do
  before do
    login_as(FactoryBot.create(:user))
  end
  # this will create a 'article' method, before each scenario is ran
  let!(:article) { Article.create(body: 'hello from rails', title: 'Ruby Yagi') }

  it 'empty title and body' do
    visit article_body
  
    # click the link that has the text 'Edit'
    click_button 'Edit'
    
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    
    click_button 'Submit'

    # The page should show error message 'Title can't be blank'
    expect(page).to have_content("Title can't be blank")

    # The bookmark title should be unchanged
    expect(article.reload.title).to eq('Ruby Yagi')
  end

  it 'valid title and body' do
    visit articles_path

    click_link 'Edit'
    fill_in 'Title', with: 'Fluffy'
    fill_in 'Body', with: 'hello from rails2'

    click_button 'Submit'

    # The page should show success message
    expect(page).to have_content("Article was successfully updated")

    # The article title and url should be updated
    expect(article.reload.title).to eq('Fluffy')
    expect(article.reload.body).to eq('hello from rails2')
  end
end