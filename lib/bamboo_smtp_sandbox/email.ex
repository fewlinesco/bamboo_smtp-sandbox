defmodule BambooSMTPSandbox.Email do
  import Bamboo.Email

  def sample_email(subject \\ "BambooSMTP Sandbox", text_body \\ "Hello 👋") do
    new_email(
      to: System.get_env("EMAIL_TO"),
      from: System.get_env("EMAIL_FROM"),
      subject: subject,
      text_body: text_body
    )
  end
end
