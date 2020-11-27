require './lib/secret_diary.rb'

describe SecretDiary do


  describe '#initialize' do
    secret_diary = SecretDiary.new

    it 'should be respond to new' do
      expect(secret_diary).to be_instance_of(SecretDiary)
    end

    it 'should be intialized locked' do
      expect(secret_diary.privacy).to eq 'locked'
    end
  end

  describe '#add_entry' do
    secret_diary = SecretDiary.new
    entry = "something"

    it 'should thow an error when locked' do
      expect { secret_diary.add_entry(entry)}.to raise_error("Secret Diary is Locked")
    end
  end

  describe '#get_entries' do
    secret_diary = SecretDiary.new
    it 'should thow an error when locked' do
      expect { secret_diary.get_entries}.to raise_error("Secret Diary is Locked")
    end
  end

  describe '#unlock' do
    secret_diary = SecretDiary.new
    secret_diary.unlock
    entry = "something"
    it 'should unlock the diary' do
      expect(secret_diary.privacy).to eq 'unlocked'
    end

    it 'should allow an entry to be added' do
      expect(secret_diary.add_entry(entry)).to eq 'entry added'
    end

    it 'should return entries' do
      expect(secret_diary.get_entries).to eq ["#{entry}"]
    end
  end
end
