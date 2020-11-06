defmodule BambooSMTPSandbox.Sender do
  @moduledoc """
  Functions for delivering emails using BambooSMTP and based on our Email factory.

  In development environment, the log level should be set to `:debug`, allowing
  you to see the content of the email you try to send.

  Feel free to tweaks this module by adding new function(s) reproducing the issue(s)
  you want to fix.
  """

  @doc """
  Deliver an email right away.

  The email contains a body and a subject but no attachments.
  """
  @spec send_sample_email() :: Bamboo.Email.t()
  def send_sample_email do
    email = BambooSMTPSandbox.Email.sample_email()

    BambooSMTPSandbox.Mailer.deliver_now(email)
  end

  @doc """
  Deliver an email right away.

  The email contains a body, a subject and some attachments based on the content
  of the folder `priv/attachments`.
  """
  @spec send_sample_email_with_attachments() :: Bamboo.Email.t()
  def send_sample_email_with_attachments do
    email = BambooSMTPSandbox.Email.sample_email_with_attachments()

    BambooSMTPSandbox.Mailer.deliver_now(email)
  end
end
