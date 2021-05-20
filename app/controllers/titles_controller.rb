class TitlesController < ApplicationController
  def index
    @title = Title.all
  end

  def show
  end

  def new
    @title = Title.new
  end

  # GET /titles/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)

    respond_to do |format|
      if @title.save
        format.html { redirect_to @title, notice: "Title was successfully created." }
        format.json { render :show, status: :created, location: @title }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to @title, notice: "title was successfully updated." }
        format.json { render :show, status: :ok, location: @title }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    @title.destroy
    respond_to do |format|
      format.html { redirect_to titles_url, notice: "title was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end
end