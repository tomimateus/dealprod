class NewsletterFrequenciesController < ApplicationController
  # GET /newsletter_frequencies
  # GET /newsletter_frequencies.json
  def index
    @newsletter_frequencies = NewsletterFrequency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newsletter_frequencies }
    end
  end

  # GET /newsletter_frequencies/1
  # GET /newsletter_frequencies/1.json
  def show
    @newsletter_frequency = NewsletterFrequency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newsletter_frequency }
    end
  end

  # GET /newsletter_frequencies/new
  # GET /newsletter_frequencies/new.json
  def new
    @newsletter_frequency = NewsletterFrequency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newsletter_frequency }
    end
  end

  # GET /newsletter_frequencies/1/edit
  def edit
    @newsletter_frequency = NewsletterFrequency.find(params[:id])
  end

  # POST /newsletter_frequencies
  # POST /newsletter_frequencies.json
  def create
    @newsletter_frequency = NewsletterFrequency.new(params[:newsletter_frequency])

    respond_to do |format|
      if @newsletter_frequency.save
        format.html { redirect_to @newsletter_frequency, notice: 'Newsletter frequency was successfully created.' }
        format.json { render json: @newsletter_frequency, status: :created, location: @newsletter_frequency }
      else
        format.html { render action: "new" }
        format.json { render json: @newsletter_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newsletter_frequencies/1
  # PUT /newsletter_frequencies/1.json
  def update
    @newsletter_frequency = NewsletterFrequency.find(params[:id])

    respond_to do |format|
      if @newsletter_frequency.update_attributes(params[:newsletter_frequency])
        format.html { redirect_to @newsletter_frequency, notice: 'Newsletter frequency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newsletter_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_frequencies/1
  # DELETE /newsletter_frequencies/1.json
  def destroy
    @newsletter_frequency = NewsletterFrequency.find(params[:id])
    @newsletter_frequency.destroy

    respond_to do |format|
      format.html { redirect_to newsletter_frequencies_url }
      format.json { head :no_content }
    end
  end
end
