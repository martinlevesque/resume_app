class ExperienceSkillsController < AdminController
  before_action :set_experience_skill, only: [:show, :edit, :update, :destroy]

  # GET /experience_skills
  # GET /experience_skills.json
  def index
    @experience_skills = ExperienceSkill.all
  end

  # GET /experience_skills/1
  # GET /experience_skills/1.json
  def show
  end

  # GET /experience_skills/new
  def new
    @experience_skill = ExperienceSkill.new
  end

  # GET /experience_skills/1/edit
  def edit
  end

  # POST /experience_skills
  # POST /experience_skills.json
  def create
    @experience_skill = ExperienceSkill.new(experience_skill_params)

    respond_to do |format|
      if @experience_skill.save
        format.html { redirect_to @experience_skill, notice: 'Experience skill was successfully created.' }
        format.json { render :show, status: :created, location: @experience_skill }
      else
        format.html { render :new }
        format.json { render json: @experience_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_skills/1
  # PATCH/PUT /experience_skills/1.json
  def update
    respond_to do |format|
      if @experience_skill.update(experience_skill_params)
        format.html { redirect_to @experience_skill, notice: 'Experience skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience_skill }
      else
        format.html { render :edit }
        format.json { render json: @experience_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_skills/1
  # DELETE /experience_skills/1.json
  def destroy
    @experience_skill.destroy
    respond_to do |format|
      format.html { redirect_to experience_skills_url, notice: 'Experience skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience_skill
      @experience_skill = ExperienceSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_skill_params
      params.require(:experience_skill).permit(:experience_id, :skill_id, :nb_months)
    end
end
