class SecretDiary
  attr_reader :privacy

  def initialize
    @privacy = "locked"
    @entries = []
  end

  def add_entry(entry)
    raise "Secret Diary is Locked" unless @privacy == "unlocked"
    @entries << entry
    "entry added"
  end

  def get_entries
    raise "Secret Diary is Locked" unless @privacy == "unlocked"
    @entries
  end

  def unlock
    @privacy = "unlocked"
  end

  def lock
    @privacy = "locked"
  end

end
