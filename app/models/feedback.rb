class Feedback < ApplicationRecord
  validates :first_name, :last_name, :identification_number, :email, :company, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :identification_number, uniqueness: true # Asegura que la cédula sea única

  # Definimos un hash para mapear los números de calificación a texto
  # Esto nos permite almacenar un entero en la BD y mostrar un texto legible
  RATING_OPTIONS = {
    1 => 'Mala',
    2 => 'Regular',
    3 => 'Buena'
  }.freeze

  validates :enjoyment_experience_rating, :benefit_discovery_rating, :interaction_participation_rating,
            presence: true, inclusion: { in: RATING_OPTIONS.keys }

  # Métodos para obtener el texto de la calificación
  def enjoyment_experience_rating_text
    RATING_OPTIONS[enjoyment_experience_rating]
  end

  def benefit_discovery_rating_text
    RATING_OPTIONS[benefit_discovery_rating]
  end

  def interaction_participation_rating_text
    RATING_OPTIONS[interaction_participation_rating]
  end
end