local typedefs = require "kong.db.schema.typedefs"

return {
  name = "token-validation",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    {
      config = {
        type = "record",
        fields = {
          { validation_url = { type = "string", required = true } },
          { ignore_routes = { type = "array", elements = { type = "string" }, default = {} } },
          { connect_timeout = { type = "number", default = 2000 } },
          { read_timeout = { type = "number", default = 2000 } },
          { write_timeout = { type = "number", default = 2000 } },
        },
      },
    },
  },
}