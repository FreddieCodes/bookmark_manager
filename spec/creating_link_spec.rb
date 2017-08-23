feature 'Links form' do

  scenario 'I can see the form with the links' do
  	visit '/links/new'
  	expect(page).to have_field("url")
  	expect(page).to have_field("title")
  end

  scenario 'I can see the Add button' do
  	visit '/links'

  end

  scenario 'I can see my bookmarks' do
  	visit '/links/new'
  	fill_in("url", with: "http://www.google.co.uk")
  	fill_in("title", with: "Google")
  	click_button("Add")
  	expect(current_path).to eq '/links'
    within 'ul#links' do
  	  expect(page).to have_content("Title: Google")
    end
  end

end
