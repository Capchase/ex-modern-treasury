import Config

config :modern_treasurer,
  base_url: System.get_env("MODERN_TREASURY_BASE_URL", "https://app.moderntreasury.com/api"),
  organization_id: System.get_env("MODERN_TREASURY_ORGANIZATION_ID"),
  api_key: System.get_env("MODERN_TREASURY_API_KEY")
