defmodule BambooSMTPSandbox.Email do
  @moduledoc """
  Contains functions for creating email structures using Bamboo.

  This module can be considered as a Factory module. Each time we want to build a
  new email structure that slightly differed from the existing ones, we should
  add a new function here.
  """
  import Bamboo.Email

  @doc """
  Used to create a new email with the following fields being populated:

  - `:to`: with the content of the environment variable `EMAIL_TO`.
  - `:from`: with the content of the environment variable `EMAIL_FROM`.
  - `:subject`: with the corresponding argument or with a default value.
  - `:text_body`: with the corresponding argument or with a default value.

  ## Example

    # Same as sample_email()
    sample_email("BambooSMTP Sandbox", "Hello 👋")
  """
  @spec sample_email(String.t(), String.t()) :: Bamboo.Email.t()
  def sample_email(subject \\ "BambooSMTP Sandbox", text_body \\ "Hello 👋") do
    new_email(
      to: System.get_env("EMAIL_TO"),
      from: System.get_env("EMAIL_FROM"),
      subject: subject,
      text_body: text_body
    )
  end

  @doc """
  Used to create a new email with the following fields being populated:

  - `:to`: with the content of the environment variable `EMAIL_TO`.
  - `:from`: with the content of the environment variable `EMAIL_FROM`.
  - `:subject`: with the corresponding argument or with a default value.
  - `:text_body`: with the corresponding argument or with a default value.
  - `:attachments`: with the content of the directory `priv/attachments/`.

  ## Example

    # Same as sample_email_with_attachments()
    sample_email_with_attachments("BambooSMTP Sandbox", "Hello 👋")
  """
  @spec sample_email_with_attachments(String.t(), String.t()) :: Bamboo.Email.t()
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
