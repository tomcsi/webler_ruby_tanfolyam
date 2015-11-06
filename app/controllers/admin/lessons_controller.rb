class Admin::LessonsController < Admin::AdminController

    def index
        @course = Course.find(params[:course_id])
        @lessons = @course.lessons
    end

    def new
        @lesson = Course.find(params[:course_id]).lessons.new
    end

    def create
        @lesson = Course.find(params[:course_id]).lessons.new(lesson_params)
        if @lesson.save
            redirect_to admin_course_lessons_path
        else
            render :new
        end
    end

    def edit
        @lesson = Lesson.find(params[:id])
    end

    def update
        lesson = Lesson.find(params[:id])
        if lesson.update!(lesson_params)
          flash[:notice] = "##{params[:id]} record successfully updated!"
        else
          flash[:notice] = "Ohh ooooohh, something wrong happend!"
        end
        redirect_to admin_course_lessons_path(params[:course_id])
    end
private
    def lesson_params
        params.require(:lesson).permit(:datum, :allapot)
    end
end
