class Atom < ApplicationRecord
  def self.create_atom(params)
    temp = Atom.create(atype:params[:type], title:params[:title], time:params[:time], point:params[:point], difficulty:params[:difficulty])
    temp["id"]
  end

  def self.update_atom(params)
    
  end

end
