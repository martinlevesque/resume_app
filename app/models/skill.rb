class Skill < ApplicationRecord

  def self.years_experience_in(skill_name)

    skill = Skill.find_by_name(skill_name) rescue nil

    total_nb_months = ExperienceSkill.where(skill_id: skill.id).sum(:nb_months) rescue 0

    (total_nb_months / 12.0).round(2)
  end

end
