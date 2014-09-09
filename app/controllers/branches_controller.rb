class BranchesController < ApplicationController
  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches }
    end
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @branch = Branch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end

  # GET /branches/new
  # GET /branches/new.json
  def new
    @branch = Branch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branch }
    end
  end

  # GET /branches/1/edit
  def edit
    @branch = Branch.find(params[:id])
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(params[:branch])
    @branch.company_id = Company.where("user_id = ?", current_user.id).first.id

    respond_to do |format|
      if @branch.save
        format.html { redirect_to users_branches_company_user_path , notice: 'La sucursal ha sido creada correctamente.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { redirect_to users_branches_company_user_path(:e => "true") }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /branches/1
  # PUT /branches/1.json
  def update
    @branch = Branch.find(params[:id])

    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to :back, notice: 'La sucursal fue actualizada.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'La sucursal no fue actualizada.'}
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch = Branch.find(params[:id])
    name = @branch.name
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to users_branches_company_user_path , notice: name + ' se ha eliminado.' }
    end
  end
end
