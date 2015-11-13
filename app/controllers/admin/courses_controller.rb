class Admin::CoursesController < Admin::AdminController
    def edit
        @course = Course.find(params[:id])
    end

    def update
        course = Course.find(params[:id])
        course.update!(course_params)
        redirect_to admin_path
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to admin_path
        else
            flash[:error] = 'abc'
            render :new
        end
    end

    def destroy
        Course.find(params[:id]).destroy
        redirect_to admin_path
    end
private
    def course_params
        params.require(:course).permit(:datum, :name, :logo)
    end
end
