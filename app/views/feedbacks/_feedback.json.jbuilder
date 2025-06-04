json.extract! feedback, :id, :first_name, :last_name, :identification_number, :email, :company, :enjoyment_experience_rating, :benefit_discovery_rating, :interaction_participation_rating, :notes, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
