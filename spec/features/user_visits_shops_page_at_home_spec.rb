require 'rails_helper'

feature 'user visits home page to reach shops index' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_css 'div#div0 div#divbody div#divbody1'# a'#, text: 'Edit'
  end
end