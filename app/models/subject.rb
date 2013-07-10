class Subject
  include DataMapper::Resource

  property :id,        Serial
  property :uri,       String, :unique_index => true
  property :upvotes,   Integer, :default => 0
  property :downvotes, Integer, :default => 0

  def vote_counts
    {
      :upvotes => self.upvotes,
      :downvotes => self.downvotes
    }
  end
end
