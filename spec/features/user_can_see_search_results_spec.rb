require 'rails_helper'

describe 'User visits root path' do
  before(:each) do
    # Since we are not saving to the db just use a new rather than create
    @poem = Poem.new(author: 'Emily', title: 'poem', line: 'Not at Home to Callers Says the Naked Tree')
  end

  it 'can submit a search' do
    visit '/'

    fill_in 'author', with: 'Emily'

     click_on('Get Poems')

     expect(current_path).to eq('/search')
     # can include expectation for the count of poems
     expect(page).to have_css('.poem', count: 10)
     # I like that you are targeting sections of the page for testing
     find('.poem', match: :first) do
       expect(page).to have_content('#{@poem.author}')
       expect(page).to have_content('#{@poem.title}')
       expect(page).to have_content('#{@poem.line}')
     end
   end
end
