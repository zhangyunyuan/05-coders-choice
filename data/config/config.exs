use Mix.Config

config :data, Data.Repo,
  adapter: MssqlEcto,
  database: "CAS",
  username: "SA",
  password: "8634301Neo",
  hostname: "localhost",
  instance_name: "MSSQLSERVER",
  port: "1433"  
