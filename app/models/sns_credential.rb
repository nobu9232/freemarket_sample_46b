class SnsCredential < ActiveRecord::Base
  belongs_to :user, optional: true
end
