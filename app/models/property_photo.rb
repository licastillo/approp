class PropertyPhoto < ApplicationRecord

  belongs_to :property
  mount_uploader :photo, FotoUploader

  scope :principal, -> {
      where(hero: true)
    }

end
