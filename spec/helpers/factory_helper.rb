module FactoryHelper
  def random_user_attributes
    name = "#{Faker::Name.name} #{SecureRandom.hex(4)}"
    {
      name: name,
      email: "#{name.parameterize}@example.com",
      password: "password"
    }
  end

  def random_talk_attributes
    {
      name: Faker::Lorem.sentence
    }
  end

  def random_note_attributes
    {
      body: Faker::Lorem.paragraph
    }
  end

  def create_random_unclaimed_talk
    Talk.create(random_talk_attributes)
  end

  def create_random_claimed_talk
    user = create_random_user
    Talk.create(random_talk_attributes.merge(claimant_id: user.id))
  end

  def create_random_user
    User.create(random_user_attributes)
  end

  def create_talk_with_notes
    talk = create_random_claimed_talk

    5.times do
      user = create_random_user
      talk.notes.create(random_note_attributes.merge(author_id: user.id))
    end

    talk
  end

end
