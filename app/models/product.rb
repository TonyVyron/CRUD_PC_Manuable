class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_one_attached :image
  validate :image_is_an_image

  private

  def image_is_an_image
    return unless image.attached?

    if !image.content_type.in?(%('image/jpeg image/png image/gif'))
      errors.add(:image, 'must be a JPEG, PNG, or GIF')
    elsif image.byte_size > 5.megabytes
      errors.add(:image, 'size must be less than 5MB')
    end
  end

end
