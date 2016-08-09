class ResumeController < ApplicationController
  def index

    @educations = Education.all.order("period_end DESC")
    load_experiences

    @nb_skills_to_show = 5
    load_skills

    @general_infos = GeneralInfo.last

  end

  def more_skills
    load_experiences
    load_skills
    @nb_skills_to_show = @skills_infos.count
  end

  private

  def load_experiences
    @experiences = Experience.all.order("period_end DESC")
  end

  def load_skills
    @skills_infos = calc_skills(@experiences, 100) # hopefully, we don't have 100 skills ;)
  end

  def calc_skills(experiences, limit = 5)
    skills = experiences.map { |e| e.experience_skills.map { |es| es.skill } }.flatten(1).uniq

    skills_infos = []

    skills.each do |s|
      total_nb_months = ExperienceSkill.where(skill_id: s.id).sum(:nb_months)
      si = {}
      si[:total_nb_months] = total_nb_months
      si[:percent_guru] = [total_nb_months.to_f / (4 * 12).to_f, 1].min
      si[:skill] = s
      skills_infos << si
    end

    return skills_infos.sort_by { |si| si[:total_nb_months] }.reverse[0..limit-1]
  end

end
