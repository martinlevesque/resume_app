class ResumeController < ApplicationController
  def index

    @educations = Education.all.order("period_end DESC")
    @experiences = Experience.all.order("period_end DESC")

    @skills_infos = calc_skills(@experiences)

  end

  private

  def calc_skills(experiences, limit = 5)
    skills = experiences.map { |e| e.experience_skills.map { |es| es.skill } }.flatten(1).uniq

    skills_infos = []

    skills.each do |s|
      total_nb_months = ExperienceSkill.where(skill_id: s.id).sum(:nb_months)
      si = {}
      si[:total_nb_months] = total_nb_months
      si[:percent_guru] = total_nb_months.to_f / (4 * 12).to_f
      si[:skill] = s
      skills_infos << si
    end

    return skills_infos
  end

end
