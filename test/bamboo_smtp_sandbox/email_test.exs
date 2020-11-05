defmodule BambooSMTPSandbox.EmailTest do
  use ExUnit.Case

  test "
    sample_email should:
      - create a new Bamboo.Email
    " do
    bamboo_email = BambooSMTPSandbox.Email.sample_email()

    assert bamboo_email.__struct__ == Bamboo.Email

    refute is_nil(bamboo_email.to)
    refute is_nil(bamboo_email.from)
    refute is_nil(bamboo_email.subject)
    refute is_nil(bamboo_email.text_body)
  end

  test "
    sample_email should:
      - create a new Bamboo.Email
      - override subject and text_body values
    " do
    bamboo_email = BambooSMTPSandbox.Email.sample_email("Sandbox - Test", "This is a test")

    assert bamboo_email.__struct__ == Bamboo.Email

    assert bamboo_email.subject == "Sandbox - Test"
    assert bamboo_email.text_body == "This is a test"

    refute is_nil(bamboo_email.to)
    refute is_nil(bamboo_email.from)
  end

  test "
    sample_email_with_attachments should:
      - create a new Bamboo.Email
      - add some attachments to it
    " do
    bamboo_email = BambooSMTPSandbox.Email.sample_email_with_attachments()

    assert bamboo_email.__struct__ == Bamboo.Email

    refute length(bamboo_email.attachments) == 0

    refute is_nil(bamboo_email.to)
    refute is_nil(bamboo_email.from)
    refute is_nil(bamboo_email.subject)
    refute is_nil(bamboo_email.text_body)
  end

  test "
    sample_email_with_attachment should:
      - create a new Bamboo.Email
      - add some attachments to it
      - override subject and text_body values
    " do
    bamboo_email =
      BambooSMTPSandbox.Email.sample_email_with_attachments("Sandbox - Test", "This is a test")

    assert bamboo_email.__struct__ == Bamboo.Email

    refute length(bamboo_email.attachments) == 0

    assert bamboo_email.subject == "Sandbox - Test"
    assert bamboo_email.text_body == "This is a test"

    refute is_nil(bamboo_email.to)
    refute is_nil(bamboo_email.from)
  end
end
