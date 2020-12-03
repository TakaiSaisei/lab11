# frozen_string_literal: true

# Missed top-level documentation
class LogicController < ApplicationController
  def input; end

  def view
    limit = params[:limit].to_i
    cached_result = Automorph.find_or_initialize_by(input: limit)
    if cached_result.new_record?
      cached_result.result = automorphs(limit).map { |element| [element, element**2] }
      cached_result.save!
    end
    @result = ActiveSupport::JSON.decode(cached_result.result)

    respond_to do |format|
      format.html
      format.json do
        render json:
                 { type: @result.class.to_s, value: @result }
      end
    end
  end

  def dbview
    result = Automorph.all.map { |element| { input: element.input, result: ActiveSupport::JSON.decode(element.result) } }

    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

  private

  def automorphs(num)
    array = (1..num).select { |element| [1, 5, 6].member?(element % 10) }
    array.delete_if { |element| !(element**2).to_s.end_with?(element.to_s) }
  end
end
