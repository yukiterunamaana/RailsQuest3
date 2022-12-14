class CharacterValidator < ActiveModel::Validator
  def valid  
    { 1 => ["knight", "mage"], 2 => ["medusa", "jinn"] }
  end
  def validate record
    
    unless (valid.key? record[:team]) && (valid[record[:team]].include? record[:unit])
      record.errors.add :base, "Wrong race/class and team combo"
      false
    end
    true
  end
end


class Character < ApplicationRecord
  #include ActiveModel::Validations;

  #validate :race_class_team;
  
  # attr_reader :name, :team;
  # validates :name, acceptance: { accept: ['mage', 'knight', 'medusa', 'jinn'] }
  # validates :team, acceptance: { accept: [1, 2] }

  # def race_class_team
  #   if (!((name=='mage'||name=='knight' && team=1) ||
  #       (name=='medusa'||name=='jinn' && team=2)))
  #   errors.add("wrong class+race-team alignment");
  # end
  validates :team, presence: true
  validates :unit, presence: true
  validates_with CharacterValidator
end  