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

  def random_unregistered_github_user_attributes
    random_user_attributes.merge({
      uid: 987654,
      oauth_token: "abcdefg"
    })
  end

  def create_random_unclaimed_talk
    Talk.create(random_talk_attributes)
  end

  def create_random_claimed_talk
    user = create_random_user
    Talk.create(random_talk_attributes.merge(claimant_id: user.id))
  end

  def create_random_completed_talk
    talk = create_random_claimed_talk
    talk.notes << create_random_note
    talk
  end


  def create_random_user
    User.create(random_user_attributes)
  end

  def create_talk_with_notes
    talk = create_random_claimed_talk

    5.times do
      talk.notes << create_random_note
    end

    talk
  end


  def create_random_note
    user = create_random_user
    Note.create(random_note_attributes.merge(author_id: user.id))
  end
end
