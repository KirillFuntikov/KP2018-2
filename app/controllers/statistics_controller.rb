require 'csv'

class StatisticsController < ApplicationController
  def generate_scv_user
    respond_to do |format|
      format.html
      format.csv {send_data User.to_csv, filename: "users-#{Date.today}.csv"}
    end
  end

  def generate_csv_lab
    respond_to do |format|
      format.html
      format.csv {send_data Lab.to_csv, filename: "labs-#{Date.today}.csv"}
    end
  end

  def generate_csv_subject
    respond_to do |format|
      format.html
      format.csv {send_data Subject.to_csv, filename: "subjects-#{Date.today}.csv"}
    end
  end
end
