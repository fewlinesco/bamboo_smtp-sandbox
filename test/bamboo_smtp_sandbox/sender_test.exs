defmodule BambooSMTPSandbox.SenderTest do
  use ExUnit.Case
  use Bamboo.Test

  test "
    send_sample_email should:
      - send an email
    " do
    assert {:ok, email_sent} = BambooSMTPSandbox.Sender.send_sample_email()

    assert_delivered_email(email_sent)
  end

  test "
    send_sample_email_with_attachements should:
      - send an email
    " do
    assert {:ok, email_sent} = BambooSMTPSandbox.Sender.send_sample_email_with_attachments()

    assert_delivered_email(email_sent)
  end
end
