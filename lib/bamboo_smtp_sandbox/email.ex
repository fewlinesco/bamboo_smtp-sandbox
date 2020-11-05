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

  def sample_email_with_attachments(subject \\ "BambooSMTP Sandbox", text_body \\ "Hello 👋") do
    sample_email = sample_email(subject, text_body)
    attachments = Path.wildcard("priv/attachments/*.*")

    add_attachments(sample_email, attachments)
  end

  defp add_attachments(email, []), do: email

  defp add_attachments(email, [attachment | attachments]) do
    email
    |> put_attachment(attachment)
    |> add_attachments(attachments)
  end
end
