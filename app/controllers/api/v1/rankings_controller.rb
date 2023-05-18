module Api
  module V1
    class RankingsController < ApplicationController

      def index
        p "--- params ---"
        p params

        current_date = Date.today.to_s
        p "--- current_date ---"
        p current_date

        all_dates = Ranking.where(start_date: current_date).first.records
        p "--- all_dates ---"
        p all_dates

        array = []
        data = []
        all_dates.each do |record|
          p "--- record ---"
          p record

          user = record[:user_id]
          p "--- user ---"
          p user

          unless array.include?(record[:user_id])
            value_km = 0
            all_dates.each do |record_two|
              # value_km = 0
              if record_two[:user_id] == user
                p "---record_two---"
                p record_two
                value_km = value_km + record_two[:km_traveled]
              end
              
            end
            data.push({user_id: record[:user_id], km_traveled: value_km})
            array.push(record[:user_id])
            p "--- array ---"
            p array
          end
        end

        p "--- data ---"
        p data
       
        # --------- sirve ---------
        # example = [{number: 1},{number: 2},{number: 3},{number: 4},{number: 5},{number: 6},{number: 7},{number: 8},{number: 9},{number: 10},{number: 11},{number: 12}]
        edades_ascendente = data.sort{ |a, b|
          p "--- a ---"
          p a[:km_traveled]
          if a[:km_traveled] >= b[:km_traveled]
            -1
          elsif
          a[:km_traveled] <= b[:km_traveled]
            1
          else
            0
          end
        }
        render json: { example: edades_ascendente}
        # --------- sirve ---------
        # render json: { status: :ok }
        # render json: [{number: "1"},{number: "2"},{number: "3"},{number: "4"},{number: "5"},{number: "6"},{number: "7"},{number: "8"},{number: "9"},{number: "10"}]
      end

      def example
        render json: { message: "cual es esa mi papacho"}
      end
    end
  end
end
