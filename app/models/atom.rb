class Atom < ApplicationRecord
  def self.create_atom(params)
    temp = Atom.create(atype:params[:type], title:params[:title], time:params[:time], point:params[:point], difficulty:params[:difficulty], description:params[:description])
    temp["id"]
  end

  def self.update_atom(params)
    aim_atom = Atom.find(params["aid"])
    aim_atom["atype"] = params["type"]
    aim_atom["title"] = params["title"]
    aim_atom["time"] = params["time"]
    aim_atom["point"] = params["point"]
    aim_atom["difficulty"] = params["difficulty"]
    aim_atom["description"] = params["description"]
    aim_atom.save!
  end

  def self.delete_atom(params)
    aim_atom = Atom.find(params["aid"])
    aim_atom["state"] = 1
    aim_atom.save!
  end

end
