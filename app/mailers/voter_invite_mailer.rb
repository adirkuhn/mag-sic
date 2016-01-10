class VoterInviteMailer < ApplicationMailer
    def convite(voter_invite)
    @voter_invite = voter_invite
    @url = new_user_registration_url(User.new) + '?voter_token=' + voter_invite.token

    mail(
      to: voter_invite.email,
      subject: 'Convite para assembleias'
    )
  end
end
