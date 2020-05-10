feature 'Homepage sign up' do
  scenario 'user goes on homepage and signs up' do
    visit('/')
    fill_in('email', with: 'jed@makers.com')
    fill_in('username', with: 'jed123')
    click_button('Submit')

    expect(page).to have_content("Logged in as: jed123")
  end
end
