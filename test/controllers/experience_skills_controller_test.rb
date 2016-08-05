require 'test_helper'

class ExperienceSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @experience_skill = experience_skills(:one)
  end

  test "should get index" do
    get experience_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_experience_skill_url
    assert_response :success
  end

  test "should create experience_skill" do
    assert_difference('ExperienceSkill.count') do
      post experience_skills_url, params: { experience_skill: { experience_id: @experience_skill.experience_id, skill_id: @experience_skill.skill_id } }
    end

    assert_redirected_to experience_skill_url(ExperienceSkill.last)
  end

  test "should show experience_skill" do
    get experience_skill_url(@experience_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_experience_skill_url(@experience_skill)
    assert_response :success
  end

  test "should update experience_skill" do
    patch experience_skill_url(@experience_skill), params: { experience_skill: { experience_id: @experience_skill.experience_id, skill_id: @experience_skill.skill_id } }
    assert_redirected_to experience_skill_url(@experience_skill)
  end

  test "should destroy experience_skill" do
    assert_difference('ExperienceSkill.count', -1) do
      delete experience_skill_url(@experience_skill)
    end

    assert_redirected_to experience_skills_url
  end
end
