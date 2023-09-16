require "roda"
require "./commands"

class Api < Roda
  plugin :empty_root
  plugin :json
  plugin :typecast_params

  route do |r|
    r.root do
      r.redirect "/api-doc.html"
    end

    r.on "submissions" do
      r.root do
        count = typecast_params.pos_int("count", 30)
        page = typecast_params.pos_int("page", 0)
        submissions = Commands::ListSubmissions.(count: count, page: page)
        {
          status: "success",
          data: { submissions: submissions },
        }
      end

      r.on Integer do |id|
        r.root do
          submission = Commands::GetSubmission.(id: id)
          {
            status: "success",
            data: { submission: submission },
          }
        end
      end
    end
  rescue Roda::RodaPlugins::TypecastParams::Error => e
    response.status = 400
    {
      status: "fail",
      data: { e.keys.join("/") => e.reason },
    }
  end
end