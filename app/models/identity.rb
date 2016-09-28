class Identity < ApplicationRecord
  belongs_to :user

  scope :for_auth, -> (auth) { where(uid: auth['uid'], provider: auth['provider'])}
end
