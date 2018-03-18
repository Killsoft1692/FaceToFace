class UserInfo < ApplicationRecord
  geocoded_by :get_client_ip
  after_validation :geocode

  def get_client_ip
    :client_ip
  end

  belongs_to :user
end
