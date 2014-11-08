require 'rails_helper'

feature 'Creating Cars' do
  scenario "can create a car" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')

    within('table') do
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('2300')
    end
  end

  scenario "can create a second car" do
    Car.create(
    make: 'Ford',
    model: 'Mustang',
    year: '1967',
    price:'2300'
    )
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Pontiac'
    fill_in 'Model', with: 'GTO'
    fill_in 'Year', with: '1964'
    fill_in 'Price', with: '27500'

    click_button 'Create Car'

    expect(page).to have_content('1964 Pontiac GTO created')

    within('table') do

      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('2300')

      expect(page).to have_content('Pontiac')
      expect(page).to have_content('GTO')
      expect(page).to have_content('1964')
      expect(page).to have_content('27500')
    end
  end
end

feature 'Editing cars' do
  scenario 'Edits car information year' do
    car = FactoryGirl.create(:car)
    visit '/'

    click_link 'Edit'

    fill_in 'Make',  with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year',  with: '1967'
    fill_in 'Price', with: '2300'

    fill_in 'Year', with: '1968'
    click_button 'Update'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1968')
    expect(page).to have_content('2300')
  end
end
