feature 'Links form' do

  scenario 'I can see the form with the links' do
  	visit '/links/new'
  	expect(page).to have_field("url")
  	expect(page).to have_field("title")
    expect(page).to have_field("tag")
  end

  scenario 'I can see my bookmarks' do
  	visit '/links/new'
  	fill_in("url", with: "http://www.google.co.uk")
  	fill_in("title", with: "Google")
    fill_in("tag", with: "Sports")
  	click_button("Add")
  	expect(current_path).to eq '/links'
    within 'ul#links' do
  	  expect(page).to have_content("Title: Google")
    end
  end

  scenario 'Tags work' do
  	visit '/links/new'
  	fill_in("url", with: "http://www.google.co.uk")
  	fill_in("title", with: "Google")
    fill_in("tag", with: "Sports")
  	click_button("Add")
    link = Link.first
    expect(link.tags.map(&:name)).to include('Sports')
    end
end
