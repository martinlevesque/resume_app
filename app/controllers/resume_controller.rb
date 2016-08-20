class ResumeController < ApplicationController

  #http_basic_authenticate_with :name => ADMIN_USER, :password => ADMIN_PASSWORD

  def index

    @educations = Rails.cache.fetch "educations-index" do
      Education.all.order("period_end DESC")
    end
    load_experiences

    @nb_skills_to_show = 5
    load_skills

    @general_infos = Rails.cache.fetch "general-infos-index" do
      GeneralInfo.last
    end


    @base_url = request.base_url

    respond_to do |format|
      format.html do
      end
      format.pdf do

        render :pdf => 'file_name',
               :template => 'resume/index.pdf.erb',
               encoding: 'utf8',
               default_header: false,
               book: false,
               :margin => { :bottom => 20, :top => 20 },
               header: { right: '[page] of [topage]' },
               :layout => 'pdf.html.erb'
      end
    end

  end

  def more_skills
    @skill_category = SkillCategory.find(params[:skill_category_id])
    load_experiences
    load_skills
    @nb_skills_to_show = 1000
  end

  private

  def load_experiences
    @experiences = Rails.cache.fetch "load-experiences" do
      Experience.all.order("period_end DESC")
    end
  end

  def load_skills
    @skills_infos = Rails.cache.fetch "load-skills-infos" do
      calc_skills(@experiences) # hopefully, we don't have 100 skills ;)
    end
    puts "skills infos = #{@skills_infos}"
  end

  def calc_skills(experiences)
    skill_cats = SkillCategory.all

    return skill_cats.map { |sc| {category: sc, skills_infos: calc_skills_for_category(sc, experiences)} }
      .sort_by { |s| s[:skills_infos].sum { |element| element[:total_nb_months] } }.reverse
  end

  def calc_skills_for_category(skill_cat, experiences, limit = 100)

    skills = experiences.map { |e| e.experience_skills.map { |es| es.skill } }.flatten(1).uniq
    skills = skills.select { |s| s.in?(skill_cat.skills) }

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
