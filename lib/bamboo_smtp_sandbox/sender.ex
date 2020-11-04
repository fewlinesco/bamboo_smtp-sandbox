defmodule BambooSMTPSandbox.Sender do
  def send_sample_email do
    email = BambooSMTPSandbox.Email.sample_email()

    BambooSMTPSandbox.Mailer.deliver_now(email)
  end
end
