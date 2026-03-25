class User < ApplicationRecord
  include OmniauthAttributesConcern
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:kakao, :naver, :twitter, :facebook, :apple, :google_oauth2, :github]

  acts_as_voter
  acts_as_votable

  before_create :default_values
  has_many :orders, dependent: :destroy
  has_many :user_authentications, dependent: :destroy
  has_many :user_pictures, dependent: :destroy
  has_one :user_content, dependent: :destroy

  validates_presence_of :email
  validates_length_of :email, within: 4..40
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email
  validates_length_of :name, within: 0..60, allow_blank: true
  validates_length_of :password, :within => 5..255, allow_blank: true

  accepts_nested_attributes_for :user_authentications, allow_destroy: true
  accepts_nested_attributes_for :user_content, :allow_destroy => true
  accepts_nested_attributes_for :user_pictures, :allow_destroy => true

  def self.create_from_omniauth(params)
    self.__send__(params.provider, params)
  end

  def remember_me
    super || false
  end

  private

  def default_values
    self.name ||= '#'+SecureRandom.uuid
  end
end
