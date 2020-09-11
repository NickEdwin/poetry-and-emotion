require 'rails_helper'

describe "User visits root path" do
  before(:each) do
    @poem1 = Poem.create(author: "Emily", title: "poem", line: "Not at Home to Callers Says the Naked Tree")
    @poem1 = Poem.create(author: "Emily", title: "poem", line: "Defrauded I a Butterfly")
  end

  it "can submit a search" do
    visit '/'

    fill_in "author", with: "Emily"

     click_on("Get Poems")

     expect(current_path).to eq("/search")


     find(".poem", match: :first) do
       expect(page).to have_content("#{@poem1.author}")
       expect(page).to have_content("#{@poem1.title}")
       expect(page).to have_content("#{@poem1.line}")
     end
   end
end
