class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy, :generate_cover_letter]

  def index
    jobs = Job.all
    render json: jobs
  end

  def show
    render json: @job
  end

  def create
    job = Job.new(job_params)

    if job.save
      render json: job, status: :created
    else
      render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: { errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    head :no_content
  end

  def generate_cover_letter
    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

    prompt = <<~PROMPT
      Write a professional, concise cover letter for this job.

      Company: #{@job.company}
      Job Title: #{@job.title}
      Status: #{@job.status}
      Location: #{@job.location}
      Job Link: #{@job.link}
      Notes: #{@job.notes}

      Requirements:
      - Keep it to 3 short paragraphs
      - Sound confident and natural
      - Do not invent fake experience
      - Tailor it specifically to the company and role
    PROMPT

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [
          { role: "user", content: prompt }
        ],
        temperature: 0.7
      }
    )

    cover_letter = response.dig("choices", 0, "message", "content")

    render json: { cover_letter: cover_letter }

  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:company, :title, :status, :location, :link, :date_applied, :notes)
  end
end