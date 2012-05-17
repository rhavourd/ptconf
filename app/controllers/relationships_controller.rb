class RelationshipsController < ApplicationController

  def destroy
    @student = Student.find(params[:student_id])
    @relationship = @student.relationships.find(params[:id])
  end
end
