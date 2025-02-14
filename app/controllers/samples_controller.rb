class SamplesController < ApplicationController
  before_action :set_sample, only: %i[ show destroy ]

  def index
    @samples = Sample.all
  end

  def show
  end

  # GET /samples/new
  def new
    @sample = Sample.new
  end

  def confirm
    @sample = Sample.new(sample_params)

    if @sample.valid?
      render :confirm, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @sample = Sample.new(sample_params)

    @sample.save!

    render :create, status: :see_other
  end

  def destroy
    @sample.destroy!

    redirect_to samples_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = Sample.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sample_params
      params.expect(sample: [ :title ])
    end
end
