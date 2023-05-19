module Api
  module V1
    class RankingsController < ApplicationController

      def index
        current_date = Date.today.to_s
        all_records = Ranking.where(start_date: current_date)&.first&.records
        # all_records = Ranking.where(start_date: "2023-05-17")&.first&.records
        array = []
        data = []

        return render json: { message: "there is no ranking" } if all_records == nil
        all_records.each do |record|

          user = record[:user_id]
          unless array.include?(record[:user_id])
            value_km = 0
            all_records.each do |record_data|
              if record_data[:user_id] == user
                value_km = value_km + record_data[:km_traveled]
              end
            end
            data.push({user_id: record[:user_id], km_traveled: value_km})
            array.push(record[:user_id])
          end
        end

        current_ranking = data.sort{ |a, b|
          if a[:km_traveled] >= b[:km_traveled]
            -1
          elsif
          a[:km_traveled] <= b[:km_traveled]
            1
          else
            0
          end
        }
        render json: { index: current_ranking}
      end

      def ranking_filter
        first_date = "#{params[:year]}-#{params[:month]}-01"
        last_date = "#{params[:year]}-#{params[:month]}-30"
        array = []
        data = []

        get_records = Ranking.where("start_date >= ? OR start_date <= ?", first_date, last_date)
        return render json: { message: "there is no ranking" } if get_records == nil

        get_records.each do |ranking|
          all_records = ranking&.records

          all_records.each do |record|
            user = record[:user_id]
  
            unless array.include?(record[:user_id])
              value_km = 0
              all_records.each do |record_data|
                if record_data[:user_id] == user
                  value_km = value_km + record_data[:km_traveled]
                end
              end
              data.push({user_id: record[:user_id], km_traveled: value_km})
              array.push(record[:user_id])
            end
          end
        end

        response = data.sort{ |a, b|
          if a[:km_traveled] >= b[:km_traveled]
            -1
          elsif
          a[:km_traveled] <= b[:km_traveled]
            1
          else
            0
          end
        }
        render json: { ranking_filter: response }
      end

      def create_record
        current_date = Date.today.to_s
        ranking = Ranking.where(start_date: current_date).first
        create_record = ranking.records.create!(user_id: params[:id_user], km_traveled: params[:km_traveled])

        render json: create_record
      end
    end
  end
end
