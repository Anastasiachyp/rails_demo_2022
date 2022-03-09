RSpec.describe Article, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:body).of_type(:text) }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:article)).to be_valid
    end
  end

  describe 'Attachment' do
    it { is_expected.to respond_to(:attach_image).with(1).argument }

    it 'is expected to be valid' do
      subject.image.attach(io: File.open(fixture_path + '/fixture_image.jpg'), filename: 'attachment.jpg',
                           content_type: 'image/jpg')
      expect(subject.image).to be_attached
    end
  end
end
