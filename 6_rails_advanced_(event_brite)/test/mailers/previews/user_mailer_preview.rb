# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.create(
      first_name: 'Arthur',
      last_name: 'Pandragon',
      email: 'arthur_pendragon2@yopmail.com',
      description: 'Je gouverne un royaume de petzouille.',
      encrypted_password: 'test'
    )

    UserMailer.welcome_email(user)
  end
end
