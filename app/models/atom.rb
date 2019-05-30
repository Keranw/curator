class Atom < ApplicationRecord
  def self.create_atom(params, author, department)

    temp = Atom.create(author:author, institution:department, title:params[:title], description:params[:description], topic1:params[:t1], lo1:params["lo1"], topic2:params[:t2], lo2:params[:lo2], tags:params[:tags]#, time:params[:time], point:params[:point], difficulty:params[:difficulty]
    )
    temp["id"]
  end

  def self.update_atom(params)
    aim_atom = Atom.find(params["aid"])
    aim_atom["description"] = params["description"]
    aim_atom["title"] = params["title"]
    aim_atom["topic1"] = params["t1"]
    aim_atom["topic2"] = params["t2"]
    aim_atom["lo1"] = params["lo1"]
    aim_atom["lo2"] = params["lo2"]
    aim_atom["tags"] = params["tags"]
    aim_atom.save!
  end

  def self.delete_atom(params)
    aim_atom = Atom.find(params["aid"])
    aim_atom["state"] = 1
    aim_atom.save!
  end


end
