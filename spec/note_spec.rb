describe Note do
  it { should belong_to(:talk) }
  it { should belong_to(:author) }

  describe "#author_name" do
    context "when no author is for the Note" do
      its(:author_name) { should eql "" }
    end

    context "when there is an author for the note" do
      let(:user) { User.new(random_user_attributes) }
      subject(:note) { Note.new(author: user) }
      its(:author_name) { should eql user.name }
    end
  end
end
