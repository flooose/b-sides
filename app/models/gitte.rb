class Gitte < ApplicationRecord
  validates :reponame, presence: true
  validates :url, presence: true
end
