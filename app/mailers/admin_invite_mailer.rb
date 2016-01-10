class AdminInviteMailer < ApplicationMailer

  def convite(admin_invite)
    @admin_invite = admin_invite
    @url = new_user_registration_url(User.new) + '?admin_token=' + admin_invite.token

    mail(
      to: admin_invite.email,
      subject: 'Convite para assembleias'
    )
  end
end