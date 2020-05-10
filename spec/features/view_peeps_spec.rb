feature 'New peep' do
  scenario 'User makes a new peep' do
    visit('/')
    fill_in('email', with: 'jed@makers.com')
    fill_in('username', with: 'jed123')
    click_button('Submit')
    click_button('New Peep')
    fill_in('peep', with: 'My first peep')
    click_button('Peep')

    expect(page).to have_content('My first peep')
  end
end
