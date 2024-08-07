class TagsController < ApplicationController
  before_action :set_tag, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  # GET /tags or /tags.json
  def index
    @tags = Tag.where("title ILIKE ?", "%#{params[:query]}%").for_user(current_user)
    @pagy, @tags = pagy(@tags)
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_url, notice: "Tag was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_url, notice: "Tag was successfully updated." }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy!

    respond_to do |format|
      format.html { redirect_to tags_url, notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @query = params[:query]
    @tags = Tag.where("title ILIKE ?", "%#{@query}%").for_user(current_user)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("index-table", partial: "index_table")
      end
      format.html { redirect_to tags_url(query: @query) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:title, :user_id)
    end
end
